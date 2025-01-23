package chart

import (
	"context"
	"log/slog"
	"text/template"

	"github.com/Archisman-Mridha/kue/pkg/components/convertors/chart/helm/engine"
	"github.com/Archisman-Mridha/kue/pkg/utils/assert"
	"github.com/Archisman-Mridha/kue/pkg/utils/logger"
	"helm.sh/helm/v3/pkg/chart/loader"
	"helm.sh/helm/v3/pkg/chartutil"
)

type ConvertChartArgs struct {
	// Relative path to the Helm chart.
	Path string
}

func ConvertChart(ctx context.Context, args ConvertChartArgs) {
	ctx = logger.AppendSlogAttributesToCtx(ctx, []slog.Attr{
		slog.String("chart", args.Path),
	})

	slog.DebugContext(ctx, "Generating CueLang files from Helm Chart")

	chart, err := loader.LoadDir(args.Path)
	assert.AssertErrNil(ctx, err, "Failed loading Helm Chart")

	// Load all the Go Templates contained in the Helm Chart and its dependencies.
	renderables := engine.AllTemplates(chart, chartutil.Values{})

	// Sort the Go Templates, so we can process them in a predictable order.
	// The order favors higher-level (in file system) templates over deeply nested templates.
	keys := engine.SortTemplates(renderables)

	templateExecutor := template.New("gotmpl")

	// Register all the template functions provided by Helm, to the the template executor.
	engine.InitFunMap(templateExecutor)

	for _, templateName := range keys {
		scopedCtx := logger.AppendSlogAttributesToCtx(ctx, []slog.Attr{
			slog.String("template", templateName),
		})

		renderable := renderables[templateName]

		// Parse the template and get its corresponding AST (Abstract Syntax Tree).
		parsedTemplate, err := templateExecutor.Parse(renderable.Tpl)
		assert.AssertErrNil(scopedCtx, err, "Failed parsing Go Template in Helm Chart")

		_ = parsedTemplate

		panic("UNIMPLEMENTED")
	}
}
