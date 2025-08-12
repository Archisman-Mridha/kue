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

package vendor

import (
	"github.com/spf13/cobra"

	"github.com/Archisman-Mridha/kue/internal/constants"
	"github.com/Archisman-Mridha/kue/internal/core/vendorer"
)

var CRDsCommand = &cobra.Command{
	Use: "crds",

	Short: "Generate CueLang schema for CRDs stored in a Git repository",

	Run: func(command *cobra.Command, args []string) {
		vendorer.VendorCRDs(command.Context(), &vendorer.VendorCRDsArgs{
			RepositoryURL: repositoryURL,
			DirectoryPath: directoryPath,
			CueModRoot:    cueModRoot,
		})
	},
}

var repositoryURL,
	directoryPath,
	cueModRoot string

func init() {
	// CLI flags.

	CRDsCommand.Flags().
		StringVar(&repositoryURL, constants.FlagNameRepositoryURL, "",
			"URL to the Git repository containing the CRDs",
		)
	CRDsCommand.MarkFlagRequired(constants.FlagNameRepositoryURL)

	CRDsCommand.Flags().
		StringVar(&directoryPath, constants.FlagNameDirectoryPath, "",
			"Path (relative to the repository root) to the directory containing the CRDs",
		)
	CRDsCommand.MarkFlagRequired(constants.FlagNameDirectoryPath)
	CRDsCommand.MarkFlagDirname(constants.FlagNameDirectoryPath)

	CRDsCommand.Flags().
		StringVar(&cueModRoot, constants.FlagNameCueModRoot, ".",
			"Path to the CueLang module directory",
		)
	CRDsCommand.MarkFlagDirname(constants.FlagNameCueModRoot)
}
