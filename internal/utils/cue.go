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

package utils

import (
	"context"
	"log/slog"

	"cuelang.org/go/cue"

	"github.com/Archisman-Mridha/kue/internal/utils/assert"
	"github.com/Archisman-Mridha/kue/internal/utils/logger"
)

// Returns stringified value of the node at the given path, from the given root node.
func GetNodeStringValueAtPath(ctx context.Context,
	rootNode *cue.Value,
	relativePath string,
) string {
	absolutePath := rootNode.Path().String() + "." + relativePath

	ctx = logger.AppendSlogAttributesToCtx(ctx, []slog.Attr{
		slog.String("ast-node-path", absolutePath),
	})

	node := rootNode.LookupPath(cue.ParsePath(relativePath))
	assert.Assert(ctx, node.Exists(), "AST node doesn't exist")

	nodeKind := node.Value().Kind().String()
	switch nodeKind {
	// Return stringified JSON encoding.
	case "struct":
		nodeByteValue, err := node.MarshalJSON()
		assert.AssertErrNil(ctx, err, "Failed getting JSON marshalled AST node value")

		return string(nodeByteValue)

	// Return default stringified value.
	default:
		nodeStringValue, err := node.String()
		assert.AssertErrNil(ctx, err, "Failed getting AST node value as string")

		return nodeStringValue
	}
}
