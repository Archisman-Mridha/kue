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
	"os"
	"path/filepath"

	"github.com/Archisman-Mridha/kue/internal/utils/assert"
	"github.com/Archisman-Mridha/kue/internal/utils/logger"
)

// Writes the given content to the file at the given path.
// If the intermediate directories and the file don't exist, they are created first.
func WriteToFile(ctx context.Context, content []byte, destinationFilePath string) {
	destinationDirectory := filepath.Dir(destinationFilePath)
	err := os.MkdirAll(destinationDirectory, 0o750)
	assert.AssertErrNil(ctx, err,
		"Failed creating directory",
		slog.String("path", destinationDirectory),
	)

	ctx = logger.AppendSlogAttributesToCtx(ctx, []slog.Attr{
		slog.String("path", destinationFilePath),
	})

	destinationFile, err := os.Create(destinationFilePath)
	assert.AssertErrNil(ctx, err, "Failed creating file")
	//nolint:errcheck
	defer destinationFile.Close()

	_, err = destinationFile.Write(content)
	assert.AssertErrNil(ctx, err, "Failed writing to file")
}

// Creates intermediate directories which don't exist for the given file path.
func CreateIntermediateDirsForFile(ctx context.Context, filePath string) {
	parentDir := filepath.Dir(filePath)

	err := os.MkdirAll(parentDir, 0o750)
	assert.AssertErrNil(ctx, err,
		"Failed creating intermediate directories for file",
		slog.String("path", filePath),
	)
}
