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
	cueYAMLEncoder "cuelang.org/go/encoding/yaml"
	"sigs.k8s.io/kustomize/api/krusty"
	"sigs.k8s.io/kustomize/kyaml/filesys"

	"github.com/Archisman-Mridha/kue/internal/constants"
	"github.com/Archisman-Mridha/kue/internal/utils"
	"github.com/Archisman-Mridha/kue/internal/utils/assert"
	"github.com/Archisman-Mridha/kue/internal/utils/logger"
)

func (r *Renderer) renderKustomization(ctx context.Context, app string, node cue.Value) {
	ctx = logger.AppendSlogAttributesToCtx(ctx, []slog.Attr{
		slog.String("ast-node-path", node.Path().String()),
	})

	// Encode the AST node into YAML.
	yamlEncoding, err := cueYAMLEncoder.Encode(node)
	assert.AssertErrNil(ctx, err,
		"Failed YAML encoding AST node representing a Kubernetes resource",
	)

	/*
		Create a temporary directory,
		where the kustomization.yaml and related resource files will be stored.
		It'll be removed after rendering the Kustomization.

		NOTE : We'll not use krusty's in-memory filesystem, since, when including a resource stored in
		       some remote git repository, Kustomize will error out trying to clone that remote Git
		       repository.
	*/
	kustomizationDirPath, err := os.MkdirTemp(constants.TempDirPath, "kustomization")
	assert.AssertErrNil(ctx, err, "Failed creating temporary directory for Kustomize")

	// Create kustomization.yaml file containing the YAML encoded contents,
	// in that temporary directory.

	kustomizationFilePath := path.Join(kustomizationDirPath, "kustomization.yaml")

	err = os.WriteFile(kustomizationFilePath, yamlEncoding, 0o600)
	assert.AssertErrNil(ctx, err, "Failed creating kustomization.yaml file")

	// Render the Kustomization.

	kustomizer := krusty.MakeKustomizer(krusty.MakeDefaultOptions())

	resourceMap, err := kustomizer.Run(filesys.MakeFsOnDisk(), kustomizationDirPath)
	assert.AssertErrNil(ctx, err, "Failed rendering Kustomization")

	resourceMap.DropEmpties()

	// For each resource, in the renderred map of resources.
	for _, resource := range resourceMap.Resources() {
		yamlEncoding, err := resource.AsYAML()
		assert.AssertErrNil(ctx, err, "Failed YAML encoding resource renderred using Kustomize")

		// Determine the manifest path.
		manifestPath := r.getManifestPath(app, "", &Resource{
			Kind: resource.GetKind(),

			Metadata: ResourceMetadata{
				Name:      resource.GetName(),
				Namespace: resource.GetNamespace(),
			},
		})

		// Create the manifest.
		utils.WriteToFile(ctx, yamlEncoding, manifestPath)
	}
}

// Returns whether the given AST node represents a Kustomization.
func isKustomization(node cue.Value) bool {
	nodeLabel, ok := node.Label()
	if !ok {
		return false
	}

	return nodeLabel == constants.ASTNodeLabelKustomization
}
