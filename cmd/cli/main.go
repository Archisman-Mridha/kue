package main

import (
	"log/slog"
	"os"

	"github.com/Archisman-Mridha/kue/cmd/cli/convert"
	"github.com/Archisman-Mridha/kue/constants"
	"github.com/Archisman-Mridha/kue/pkg/utils/logger"
	"github.com/spf13/cobra"
)

var rootCmd = &cobra.Command{
	Use: "kue",
	RunE: func(cmd *cobra.Command, args []string) error {
		return cmd.Help()
	},
}

func init() {
	// Subcommands.
	rootCmd.AddCommand(convert.ConvertCmd)

	// Flags.
	var isDebugModeEnabled bool
	rootCmd.PersistentFlags().
		BoolVar(&isDebugModeEnabled, constants.FlagNameDebug, false, "Generate debug logs")

	// Initialization tasks.

	// Initialize logger.
	logger.InitLogger(isDebugModeEnabled)
}

func main() {
	if err := rootCmd.Execute(); err != nil {
		slog.Error(err.Error())
		os.Exit(1)
	}
}
