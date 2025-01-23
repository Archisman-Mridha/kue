package convert

import (
	"github.com/Archisman-Mridha/kue/pkg/components/convertors/chart"
	"github.com/spf13/cobra"
)

var path string

var ChartCmd = &cobra.Command{
	Use:   "chart",
	Short: "Generates CueLang files from the given Helm Chart",
	Run: func(cmd *cobra.Command, args []string) {
		chart.ConvertChart(cmd.Context(), chart.ConvertChartArgs{
			Path: path,
		})
	},
}

func init() {
	// Flags.
	ChartCmd.Flags().
		StringVar(&path, "path", "", "Relative path to the Helm Chart")
}
