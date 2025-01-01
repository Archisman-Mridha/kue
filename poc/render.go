package main

import (
	"log/slog"
	"os"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
	"cuelang.org/go/cue/load"
)

func main() {
	instances := load.Instances([]string{"./environments/production/production.cue"}, &load.Config{
		ModuleRoot: ".",
		Dir:        ".",
	})

	cueCtx := cuecontext.New()

	productionInstance := instances[0]

	// Build the Cue instance.
	productionCueValue := cueCtx.BuildInstance(productionInstance)
	if err := productionCueValue.Err(); err != nil {
		slog.Error("Failed buildind production instance", slog.Any("error", err))
		os.Exit(1)
	}

	// Walk down the AST.
	productionCueValue.Walk(
		func(v cue.Value) bool {
			// CASE : AST node represent a Helm chart installation.
			//
			// If the AST node has label `helmInstallation`, that means it represents a Helm chart
			// installation.
			//
			// TODO :
			//
			//	(1) Verify that the AST node's value unifies with the #HelmInstallation schema
			//			definition.
			//
			//	(2) Reconsider the identifying process of this type of AST Node. Should I use attributes
			//			instead?
			//			REFER : https://cuetorials.com/deep-dives/attributes/.
			if label, _ := v.Label(); label == "helmInstallation" {
				//
				// TODO : Render the Helm chart and assign that as the value of this AST node.
				//
				// I tried using github.com/mittwald/go-helm-client, but its giving this error (due to
				// collission with ArgoCD) :
				//
				//		k8s.io/api/coordination/v1alpha1: module k8s.io/api@latest found (v0.32.0), but does
				//		not contain package k8s.io/api/coordination/v1alpha1.
				//
				// So, I guess I need to implement the Helm chart renderring logic using the official Helm
				// Go SDK (which is a pain :().
			}

			// CASE : The AST node represents a Kubernetes resource (has the apiVersion and kind fields).
			//
			// In this case, we'll stop walking the AST.
			// We'll convert the subtree into YAML and save it in a file. The file path and name will
			// depend on the Cue instance name (contains the environment name) and v.Path().String().

			return true
		},
		nil,
	)

	jsonMarshalledProductionCueValue, err := productionCueValue.MarshalJSON()
	if err != nil {
		slog.Error("Failed JSON marshalling production cue value", slog.Any("error", err))
		os.Exit(1)
	}

	_ = jsonMarshalledProductionCueValue
	// slog.Info("JSON marshalled production cue value", slog.String("value", string(jsonMarshalledProductionCueValue)))
}

func renderHelmCharts() {}
