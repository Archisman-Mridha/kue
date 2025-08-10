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
	"github.com/Archisman-Mridha/kue/internal/core/renderer"
)

var RenderCommand = &cobra.Command{
	Use: "render",

	Short: "Render a CueLang instance into Kubernetes manifests",

	Run: func(command *cobra.Command, args []string) {
		renderer := renderer.NewRenderer(cueModRoot, cueInstance, outputsDirectory)
		renderer.Render(command.Context())
	},
}

var cueModRoot,
	cueInstance,
	outputsDirectory string

func init() {
	// CLI flags.

	RenderCommand.Flags().
		StringVar(&cueModRoot, constants.FlagNameCueModRoot, ".",
			"Path to the CueLang module root",
		)
	_ = RenderCommand.MarkFlagDirname(constants.FlagNameCueModRoot)

	RenderCommand.Flags().
		StringVar(&cueInstance, constants.FlagNameCueInstance, "",
			"Path to the CueLang instance file containing the root struct",
		)
	_ = RenderCommand.MarkFlagRequired(constants.FlagNameCueInstance)
	_ = RenderCommand.MarkFlagFilename(constants.FlagNameCueInstance)

	RenderCommand.Flags().
		StringVar(&outputsDirectory, constants.FlagNameOutputsDirectory, "",
			"Path to the outputs directory, where renderred Kubernetes manifests will be stored",
		)
	_ = RenderCommand.MarkFlagRequired(constants.FlagNameOutputsDirectory)
	_ = RenderCommand.MarkFlagDirname(constants.FlagNameOutputsDirectory)
}
