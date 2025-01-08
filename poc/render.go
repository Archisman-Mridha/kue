package main

import (
	"context"
	"fmt"
	"log/slog"
	"os"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
	"cuelang.org/go/cue/load"
	"cuelang.org/go/encoding/yaml"
	"github.com/Archisman-Mridha/kue/pkg/utils/assert"
)

func main() {
	ctx := context.Background()

	var (
		instances = load.Instances([]string{"./environments/production/production.cue"}, &load.Config{
			ModuleRoot: ".",
			Dir:        ".",
		})

		productionInstance = instances[0]
	)

	cueCtx := cuecontext.New()

	// Build the Cue instance.
	productionCueValue := cueCtx.BuildInstance(productionInstance)
	err := productionCueValue.Err()
	assert.AssertErrNil(ctx, err, "Failed buildind production instance")

	// printCueValue(ctx, productionCueValue)

	// Walk down the AST.
	productionCueValue.Walk(
		func(v cue.Value) bool {
			// CASE : The AST node represents a Kubernetes resource.
			//
			// In this case, we'll stop walking the AST.
			// We'll convert the subtree into YAML and save it in a file.

			apiVersion := v.LookupPath(cue.ParsePath("apiVersion"))
			kind := v.LookupPath(cue.ParsePath("kind"))

			if apiVersion.Exists() && kind.Exists() {
				yamlEncodedK8sResource, err := yaml.Encode(v)
				assert.AssertErrNil(ctx, err, "Failed YAML marshalling Cue value representing Kubernetes resource")

				name := v.LookupPath(cue.ParsePath("metadata.name"))
				assert.Assert(ctx, name.Exists(), "Kubernetes resource doesn't have the metadata.name field", slog.Any("cue-value", v))

				namespace := v.LookupPath(cue.ParsePath("metadata.namespace"))
				assert.Assert(ctx, name.Exists(), "Kubernetes resource doesn't have the metadata.namespace field", slog.Any("cue-value", v))

				destinationFolder := fmt.Sprintf("./outputs/environments/production/%s/%s", namespace, kind)
				err = os.MkdirAll(destinationFolder, os.ModePerm)
				assert.AssertErrNil(ctx, err, "Failed creating directory", slog.String("path", destinationFolder))

				destinationFilePath := fmt.Sprintf("%s/%s.yaml", destinationFolder, name)

				destinationFile, err := os.Create(destinationFilePath)
				assert.AssertErrNil(ctx, err, "Failed creating file", slog.String("path", destinationFilePath))
				defer destinationFile.Close()

				_, err = destinationFile.Write(yamlEncodedK8sResource)
				assert.AssertErrNil(ctx, err, "Failed writing YAML marshalled Kubernetes resource to file", slog.String("path", destinationFilePath))

				return false
			}

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

			return true
		},
		nil,
	)
}

func printCueValue(ctx context.Context, v cue.Value) {
	yamlEncodedCueValue, err := yaml.Encode(v)
	assert.AssertErrNil(ctx, err, "Failed YAML marshalling Cue value")

	println(string(yamlEncodedCueValue))
}
