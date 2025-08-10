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

package core

import (
	"context"
	"fmt"
	"log/slog"
	"os"
	"path"
	"strings"

	"github.com/Archisman-Mridha/kue/internal/utils"
	"github.com/Archisman-Mridha/kue/internal/utils/assert"
	"github.com/Archisman-Mridha/kue/internal/utils/git"
)

type VendorCRDsArgs struct {
	RepositoryURL,
	DirectoryPath,
	CueModRoot string
}

func VendorCRDs(ctx context.Context, args *VendorCRDsArgs) {
	// Clone the git repository, locally.

	repositoryClonePath := git.GetRepositoryClonePath(ctx, args.RepositoryURL)

	git.CloneRepository(ctx, args.RepositoryURL)
	//nolint:errcheck
	defer os.RemoveAll(repositoryClonePath)

	// Use timoni to generate CueLang schema for each CRD.

	crdsDirectoryPath := path.Join(repositoryClonePath, args.DirectoryPath)

	directoryEntries, err := os.ReadDir(crdsDirectoryPath)
	assert.AssertErrNil(ctx, err,
		"Failed getting directory entries",
		slog.String("path", args.DirectoryPath),
	)

	for _, directoryEntry := range directoryEntries {
		// Ignore folders.
		if directoryEntry.IsDir() {
			continue
		}
		//
		// Ignore non YAML files and Kustomization YAML file.
		fileName := directoryEntry.Name()
		if !strings.HasSuffix(fileName, ".yaml") || fileName == "kustomization.yaml" {
			continue
		}

		crdFilePath := path.Join(crdsDirectoryPath, directoryEntry.Name())

		utils.MustExecuteCommand(ctx,
			fmt.Sprintf("timoni mod vendor crds %s -f %s", args.CueModRoot, crdFilePath),
		)
	}
}
