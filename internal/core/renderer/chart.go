// BSD 2-Clause License
//
// Copyright (c) 2025, Archisman Mridha
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// 1. Redistributions of source code must retain the above copyright notice, this
//    list of conditions and the following disclaimer.
//
// 2. Redistributions in binary form must reproduce the above copyright notice,
//    this list of conditions and the following disclaimer in the documentation
//    and/or other materials provided with the distribution.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
// FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

package renderer

import (
	"context"
	"encoding/json"
	"errors"
	"io"
	"log/slog"
	"os"
	"strings"

	"cuelang.org/go/cue"
	"gopkg.in/yaml.v3"
	"helm.sh/helm/v3/pkg/action"
	"helm.sh/helm/v3/pkg/chart/loader"
	"helm.sh/helm/v3/pkg/chartutil"
	"helm.sh/helm/v3/pkg/cli"

	"github.com/Archisman-Mridha/kue/internal/constants"
	"github.com/Archisman-Mridha/kue/internal/utils"
	"github.com/Archisman-Mridha/kue/internal/utils/assert"
	"github.com/Archisman-Mridha/kue/internal/utils/logger"
)

type ChartInstallation struct {
	RepoURL,
	Chart,
	Version,

	ReleaseName,
	Namespace,
	Values string
}

func (r *Renderer) renderChart(ctx context.Context, app string, rootNode *cue.Value) {
	chartInstallation := &ChartInstallation{
		RepoURL: utils.GetNodeStringValueAtPath(ctx, rootNode, constants.ASTPathRepoURL),
		Chart:   utils.GetNodeStringValueAtPath(ctx, rootNode, constants.ASTPathChart),
		Version: utils.GetNodeStringValueAtPath(ctx, rootNode, constants.ASTPathVersion),

		ReleaseName: utils.GetNodeStringValueAtPath(ctx, rootNode, constants.ASTPathReleaseName),
		Namespace:   utils.GetNodeStringValueAtPath(ctx, rootNode, constants.ASTPathNamespace),
		Values:      utils.GetNodeStringValueAtPath(ctx, rootNode, constants.ASTPathValues),
	}

	// Render the chart.
	resources := renderChart(ctx, chartInstallation)

	yamlDecoder := yaml.NewDecoder(strings.NewReader(resources))
	// For each YAML document.
	for {
		var yamlDocument any
		err := yamlDecoder.Decode(&yamlDocument)
		if errors.Is(err, io.EOF) {
			break
		}
		assert.AssertErrNil(ctx, err, "Failed unmarshalling YAML document")

		yamlDocumentAsBytes, err := yaml.Marshal(yamlDocument)
		assert.AssertErrNil(ctx, err, "Failed marshalling back YAML document")

		// Parse the YAML document into a Kubernetes resource.
		var resource Resource
		err = yaml.Unmarshal(yamlDocumentAsBytes, &resource)
		assert.AssertErrNil(ctx, err, "Failed unmarshalling Kuberenetes resource")

		// Determine the manifest path.
		manifestPath := r.getManifestPath(app, chartInstallation.Chart, &resource)

		// Create the manifest.
		utils.WriteToFile(ctx, yamlDocumentAsBytes, manifestPath)
	}
}

// Returns whether the given AST node represents a Helm chart installation.
func isChartInstallation(node *cue.Value) bool {
	nodeLabel, ok := node.Label()
	if !ok {
		return false
	}

	return nodeLabel == constants.ASTNodeLabelHelmInstallation
}

func renderChart(ctx context.Context, chartInstallation *ChartInstallation) string {
	ctx = logger.AppendSlogAttributesToCtx(ctx, []slog.Attr{
		slog.String("repo", chartInstallation.RepoURL),
		slog.String("chart", chartInstallation.Chart),
	})

	settings := cli.New()

	actionConfig := &action.Configuration{}
	err := actionConfig.Init(
		settings.RESTClientGetter(),
		settings.Namespace(),
		os.Getenv("HELM_DRIVER"),
		func(msg string, args ...any) {}, // Discard logs coming from the Helm Go SDK.
	)
	assert.AssertErrNil(ctx, err, "Failed initializing Helm action config")

	installAction := action.NewInstall(actionConfig)
	installAction.RepoURL = chartInstallation.RepoURL
	installAction.Version = chartInstallation.Version
	installAction.ReleaseName = chartInstallation.ReleaseName
	installAction.Namespace = chartInstallation.Namespace
	installAction.DryRun = true
	installAction.ClientOnly = true
	{
		kubeVersion, err := chartutil.ParseKubeVersion("v1.33.0")
		assert.AssertErrNil(ctx, err, "Failed parsing Kubernetes version")

		installAction.KubeVersion = kubeVersion
	}

	// Determine chart path.
	chartPath, err := installAction.LocateChart(chartInstallation.Chart, settings)
	assert.AssertErrNil(ctx, err, "Failed determining chart path")

	// Load the chart.
	chart, err := loader.Load(chartPath)
	assert.AssertErrNil(ctx, err, "Failed loading chart", slog.String("path", chartPath))

	values := make(map[string]any)
	err = json.Unmarshal([]byte(chartInstallation.Values), &values)
	assert.AssertErrNil(ctx, err, "Failed JSON unmarshalling chart values")

	release, err := installAction.Run(chart, values)
	assert.AssertErrNil(ctx, err, "Failed renderring chart")

	return release.Manifest
}
