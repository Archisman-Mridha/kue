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

package main

import (
	"github.com/spf13/cobra"

	"github.com/Archisman-Mridha/kue/internal/constants"
	initLib "github.com/Archisman-Mridha/kue/internal/core/init"
)

var InitCommand = &cobra.Command{
	Use: "init",

	Short: "Initialize a Kue project",

	Run: func(command *cobra.Command, args []string) {
		initLib.InitKueProject(command.Context(), &initLib.InitKueProjectArgs{
			Directory: directory,

			CueModName:     cueModName,
			RepoURL:        repoURL,
			KueProjectPath: kueProjectPath,
		})
	},
}

var directory,
	cueModName,
	repoURL,
	kueProjectPath string

func init() {
	// CLI flags.

	InitCommand.Flags().
		StringVar(&directory, constants.FlagNameDirectory, ".",
			"Path to the directory, where the Kue project will be initialized",
		)
	_ = InitCommand.MarkFlagDirname(constants.FlagNameDirectory)

	InitCommand.Flags().
		StringVar(&cueModName, constants.FlagNameCueModName, "",
			"Cue mod name",
		)
	_ = InitCommand.MarkFlagRequired(constants.FlagNameCueModName)
	_ = InitCommand.MarkFlagFilename(constants.FlagNameCueModName)

	InitCommand.Flags().
		StringVar(&repoURL, constants.FlagNameRepoURL, "",
			"URL of the Git repository, which will contain the Kue project",
		)
	_ = InitCommand.MarkFlagRequired(constants.FlagNameRepoURL)

	InitCommand.Flags().
		StringVar(&kueProjectPath, constants.FlagNameKueProjectPath, "",
			"Path of the Kue project, relative to the Git repository",
		)
	_ = InitCommand.MarkFlagRequired(constants.FlagNameKueProjectPath)
}
