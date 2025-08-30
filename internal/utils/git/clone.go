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

package git

import (
	"context"
	"log/slog"
	"os"
	"path"

	goGit "github.com/go-git/go-git/v5"
	goGitURL "github.com/kubescape/go-git-url"

	"github.com/Archisman-Mridha/kue/internal/constants"
	"github.com/Archisman-Mridha/kue/internal/utils/assert"
	"github.com/Archisman-Mridha/kue/internal/utils/logger"
)

// Clones the given git repository, if it already isn't.
func CloneRepo(ctx context.Context, url string) {
	ctx = logger.AppendSlogAttributesToCtx(ctx, []slog.Attr{
		slog.String("repository-url", url),
	})

	slog.DebugContext(ctx, "Cloning repository")

	repositoryClonePath := GetRepoClonePath(ctx, url)

	// If the repo is already cloned,
	// then we don't need to do anything.
	if _, err := os.ReadDir(repositoryClonePath); err == nil {
		return
	}

	//nolint:exhaustruct
	_, err := goGit.PlainClone(repositoryClonePath, false, &goGit.CloneOptions{
		URL:               url,
		Depth:             1,
		RecurseSubmodules: goGit.NoRecurseSubmodules,
	})
	assert.AssertErrNil(ctx, err, "Failed cloning repository")
}

// Returns path to the directory, where the Git repository will be / is already cloned.
func GetRepoClonePath(ctx context.Context, url string) string {
	parsedURL, err := goGitURL.NewGitURL(url)
	assert.AssertErrNil(ctx, err, "Failed parsing git URL")

	return path.Join(constants.TempDirPath, parsedURL.GetRepoName())
}
