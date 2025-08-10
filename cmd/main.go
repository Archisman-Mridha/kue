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
	"log/slog"
	"os"

	"github.com/spf13/cobra"

	"github.com/Archisman-Mridha/kue/cmd/vendor"
	"github.com/Archisman-Mridha/kue/internal/constants"
	"github.com/Archisman-Mridha/kue/internal/utils/logger"
)

var RootCommand = &cobra.Command{
	Use: "kue",

	PersistentPreRun: func(cmd *cobra.Command, args []string) {
		// Initialize logger.
		logger.SetupLogger(isDebugModeEnabled)
	},

	RunE: func(command *cobra.Command, args []string) error {
		return command.Help()
	},
}

var isDebugModeEnabled bool

func init() {
	// Subcommands.
	RootCommand.AddCommand(vendor.VendorCommand)
	RootCommand.AddCommand(RenderCommand)

	// CLI flags.

	RootCommand.PersistentFlags().
		BoolVar(&isDebugModeEnabled, constants.FlagNameDebug, false, "Generate debug logs")
}

func main() {
	// By default, parent's PersistentPreRun gets overriden by a child's PersistentPreRun.
	// We want to disable this overriding behaviour and chain all the PersistentPreRuns.
	// REFERENCE : https://github.com/spf13/cobra/pull/2044.
	cobra.EnableTraverseRunHooks = true

	err := RootCommand.Execute()
	if err != nil {
		slog.Error(err.Error())
		os.Exit(1)
	}
}
