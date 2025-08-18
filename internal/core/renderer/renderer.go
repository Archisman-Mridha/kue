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
	"log/slog"
	"os"
	"path"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
	"cuelang.org/go/cue/load"

	"github.com/Archisman-Mridha/kue/internal/constants"
	"github.com/Archisman-Mridha/kue/internal/utils/assert"
	"github.com/Archisman-Mridha/kue/internal/utils/logger"
)

type Renderer struct {
	// Path to the root directory of the Cue module,
	// where the cue.mod folder is located.
	cueModRoot,

	// Path to the Cue instance (.cue file), which contains the root struct,
	// and will be renderred.
	cueInstance,

	// Path to the directory, where manifests (containing renderred Kubernetes resources) will be
	// written.
	outputsDirectory string
}

func NewRenderer(cueModRoot, cueInstance, outputsDirectory string) *Renderer {
	return &Renderer{
		cueModRoot,
		cueInstance,

		outputsDirectory,
	}
}

func (r *Renderer) Render(ctx context.Context) {
	// Remove the resources directory, if it already exists.
	resourcesDirectory := path.Join(r.outputsDirectory, "resources")
	err := os.RemoveAll(resourcesDirectory)
	if !os.IsNotExist(err) {
		assert.AssertErrNil(ctx, err, "Failed removing outputs directory")
	}

	// Construct the Cue context.
	cueCtx := cuecontext.New()

	// Load the Cue instance.
	//nolint:exhaustruct
	cueInstance := load.Instances([]string{r.cueInstance}, &load.Config{
		ModuleRoot: r.cueModRoot,
		Dir:        r.cueModRoot,
	})[0]

	// Build the Cue instance.
	rootNode := cueCtx.BuildInstance(cueInstance)
	assert.AssertErrNil(ctx, rootNode.Err(), "Failed building cue instance")

	// Walk down the AST of the non-evaluated Cue instance, searching for apps.
	// The evaluated Cue instance doesn't have attributes.
	rootNode.Walk(
		func(currentNode cue.Value) bool {
			fieldAttributes := currentNode.Attributes(cue.FieldAttr)
			for _, fieldAttribute := range fieldAttributes {
				if fieldAttribute.Name() != constants.FieldAttributeApp {
					continue
				}

				// We've found the "app" field attribute.

				astPathSelectors := currentNode.Path().Selectors()
				app := astPathSelectors[len(astPathSelectors)-1].String()

				// Render the app.
				r.renderApp(ctx, app, currentNode)

				return false
			}
			return true
		},
		nil,
	)
}

func (r *Renderer) renderApp(ctx context.Context, app string, appNode cue.Value) {
	ctx = logger.AppendSlogAttributesToCtx(ctx, []slog.Attr{
		slog.String("app", app),
	})

	appNode.Walk(
		func(currentNode cue.Value) bool {
			switch {
			// When the AST node label is "helmInstallation",
			// it represents a Helm chart installation.
			case isChartInstallation(currentNode):
				// Render the Helm chart.
				r.renderChart(ctx, app, currentNode)
				return false

			// When the AST node label is "kustomization",
			// it represents a Kustomization.
			case isKustomization(currentNode):
				r.renderKustomization(ctx, app, currentNode)
				return false

			// When the AST node has the "apiVersion" and "kind" child AST nodes,
			// it represents a Kubernetes resource.
			case isResource(currentNode):
				// Render the Kubernetes resource into a file.
				r.renderResource(ctx, app, currentNode)
				return false

			// Keep walking down the AST.
			default:
				return true
			}
		},
		nil,
	)
}
