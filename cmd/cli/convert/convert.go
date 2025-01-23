package convert

import "github.com/spf13/cobra"

var ConvertCmd = &cobra.Command{
	Use:   "convert",
	Short: "Generate CueLang files from Helm Charts / Go Templates etc.",
	Run:   func(cmd *cobra.Command, args []string) {},
}

func init() {
	// Subcommands.
	ConvertCmd.AddCommand(ChartCmd)
}
