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
	pathBuilder "path"

	"cuelang.org/go/cue"
	cueYAMLEncoder "cuelang.org/go/encoding/yaml"

	"github.com/Archisman-Mridha/kue/internal/constants"
	"github.com/Archisman-Mridha/kue/internal/utils"
	"github.com/Archisman-Mridha/kue/internal/utils/assert"
)

type (
	Resource struct {
		Kind string `yaml:"kind"`

		Metadata ResourceMetadata `yaml:"metadata"`
	}

	ResourceMetadata struct {
		Name      string `yaml:"name"`
		Namespace string `yaml:"namespace,omitempty"`
	}
)

func (r *Renderer) renderResource(ctx context.Context, app string, node *cue.Value) {
	resource := &Resource{
		Kind: utils.GetNodeStringValueAtPath(ctx, node, constants.ASTNodeLabelKind),

		Metadata: ResourceMetadata{
			Name:      utils.GetNodeStringValueAtPath(ctx, node, constants.ASTPathMetadataName),
			Namespace: utils.GetNodeStringValueAtPath(ctx, node, constants.ASTPathMetadataNamespace),
		},
	}

	// Encode the AST node into YAML.
	yamlEncoding, err := cueYAMLEncoder.Encode(*node)
	assert.AssertErrNil(ctx, err,
		"Failed YAML encoding AST node representing a Kubernetes resource",
		slog.String("ast-node-path", node.Path().String()),
	)

	// Determine the manifest path.
	manifestPath := r.getManifestPath(app, "", resource)

	// Create the manifest.
	utils.WriteToFile(ctx, yamlEncoding, manifestPath)
}

// Returns whether the given AST node represents a Kubernetes resource.
func isResource(node *cue.Value) bool {
	var (
		apiVersionNode = node.LookupPath(cue.ParsePath(constants.ASTNodeLabelAPIVersion))
		kindNode       = node.LookupPath(cue.ParsePath(constants.ASTNodeLabelKind))
	)

	return (apiVersionNode.Exists() && kindNode.Exists())
}

// Returns path to the manifest, for the given Kubernetes resource, which belongs to the given app.
func (r *Renderer) getManifestPath(app, chart string, resource *Resource) string {
	path := pathBuilder.Join(r.outputsDirectory, "resources", app)

	if len(chart) > 0 {
		path = pathBuilder.Join(path, "Charts", chart)
	}

	path = pathBuilder.Join(path,
		resource.Kind,
		resource.Metadata.Namespace,
		resource.Metadata.Name+".yaml",
	)

	return path
}
