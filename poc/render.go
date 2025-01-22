package main

import (
	"bytes"
	"context"
	"errors"
	"io"
	"log/slog"
	"os"
	"path"
	"path/filepath"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
	"cuelang.org/go/cue/load"
	cueToYAML "cuelang.org/go/encoding/yaml"
	"github.com/Archisman-Mridha/kue/pkg/utils/assert"
	helmclient "github.com/mittwald/go-helm-client"
	"gopkg.in/yaml.v3"
	"helm.sh/helm/v3/pkg/chartutil"
	"helm.sh/helm/v3/pkg/repo"
)

type (
	K8sResource struct {
		Kind string `yaml:"kind"`

		Metadata K8sResourceMetadata `yaml:"metadata"`
	}

	K8sResourceMetadata struct {
		Name      string `yaml:"name"`
		Namespace string `yaml:"namespace"`
	}
)

func main() {
	ctx := context.Background()

	helmClient, err := helmclient.New(&helmclient.Options{})
	assert.AssertErrNil(ctx, err, "Failed creating Helm client")

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
	err = productionCueValue.Err()
	assert.AssertErrNil(ctx, err, "Failed buildind production instance")

	// Walk down the AST.
	productionCueValue.Walk(
		func(v cue.Value) bool {
			// CASE : The AST node represents a Kubernetes resource (has the `apiVersion` and `kind`
			//        child AST nodes).
			//
			// We'll stop walking the AST and convert the subtree into YAML and save it in a file.

			apiVersionNode := v.LookupPath(cue.ParsePath("apiVersion"))
			kindNode := v.LookupPath(cue.ParsePath("kind"))

			if apiVersionNode.Exists() && kindNode.Exists() {
				var (
					_    = getNodeStringValueAtPath(ctx, v, "apiVersion")
					kind = getNodeStringValueAtPath(ctx, v, "kind")

					name      = getNodeStringValueAtPath(ctx, v, "metadata.name")
					namespace = getNodeStringValueAtPath(ctx, v, "metadata.namespace")
				)

				yamlEncodedK8sResource, err := cueToYAML.Encode(v)
				assert.AssertErrNil(ctx, err, "Failed YAML marshalling Cue value representing Kubernetes resource")

				destinationFilePath := path.Join("./outputs/environments/production", namespace, kind, name+".yaml")
				writeToFile(ctx, yamlEncodedK8sResource, destinationFilePath)

				return false
			}

			/*
				CASE : AST node represents a Helm chart installation (has the `helmInstallation` label).

				We'll stop walking down the AST and render the Helm chart.

				TODO :

					(1) Verify that the AST node's value unifies with the #HelmInstallation schema
							definition.

					(2) Reconsider the identifying process of this type of AST Node. Should I use attributes
							instead?
							REFER : https://cuetorials.com/deep-dives/attributes/.
			*/
			if label, _ := v.Label(); label == "helmInstallation" {
				helmInstallation := v.Value()

				var (
					repoURL   = getNodeStringValueAtPath(ctx, helmInstallation, "repoURL")
					chartPath = getNodeStringValueAtPath(ctx, helmInstallation, "chartPath")
					version   = getNodeStringValueAtPath(ctx, helmInstallation, "version")

					releaseName = getNodeStringValueAtPath(ctx, helmInstallation, "releaseName")

					namespace       = getNodeStringValueAtPath(ctx, helmInstallation, "namespace")
					createNamespace = getNodeBooleanValueAtPath(ctx, helmInstallation, "createNamespace")
				)

				slog.InfoContext(ctx, "Expanding Helm installation", slog.String("chart", chartPath))

				values := helmInstallation.LookupPath(cue.ParsePath("values"))
				yamlEncodedValues, err := cueToYAML.Encode(values)
				assert.AssertErrNil(ctx, err, "Failed YAML marshalling Cue value")

				// Add Helm repository.
				// TODO : Find a better solution.
				err = helmClient.AddOrUpdateChartRepo(repo.Entry{
					Name: chartPath,
					URL:  repoURL,
				})
				assert.AssertErrNil(ctx, err, "Failed adding / updating Helm chart repo", slog.String("url", repoURL), slog.String("name", chartPath))

				yamlEncodedK8sResources, err := helmClient.TemplateChart(
					&helmclient.ChartSpec{
						ChartName: path.Join(chartPath, chartPath),
						Version:   version,

						ReleaseName: releaseName,

						Namespace:       namespace,
						CreateNamespace: createNamespace,

						ValuesYaml: string(yamlEncodedValues),
					},
					&helmclient.HelmTemplateOptions{
						KubeVersion: &chartutil.KubeVersion{Version: "1.31.0"},
					},
				)
				assert.AssertErrNil(ctx, err, "Helm template operation failed", slog.String("node-path", helmInstallation.Path().String()))

				yamlDecoder := yaml.NewDecoder(bytes.NewReader(yamlEncodedK8sResources))
				for {
					var yamlDocument interface{}
					err := yamlDecoder.Decode(&yamlDocument)
					if errors.Is(err, io.EOF) {
						break
					}
					assert.AssertErrNil(ctx, err, "Failed unmarshalling YAML document")

					yamlDocumentAsBytes, err := yaml.Marshal(yamlDocument)
					assert.AssertErrNil(ctx, err, "Failed marshalling back YAML document")

					var k8sResource K8sResource
					err = yaml.Unmarshal(yamlDocumentAsBytes, &k8sResource)
					assert.AssertErrNil(ctx, err, "Failed unmarshalling K8s resource")

					destinationFilePath := path.Join(
						"./outputs/environments/production/",
						namespace,
						k8sResource.Kind,
						k8sResource.Metadata.Name+".yaml",
					)

					writeToFile(ctx, yamlDocumentAsBytes, destinationFilePath)
				}

				return false
			}

			return true
		},
		nil,
	)
}

// Writes the given content to the file at the given path.
// If the intermediate directories and the file don't exist, then they are first created.
func writeToFile(ctx context.Context, content []byte, destinationFilePath string) {
	destinationFolder := filepath.Dir(destinationFilePath)
	err := os.MkdirAll(destinationFolder, os.ModePerm)
	assert.AssertErrNil(ctx, err, "Failed creating directory", slog.String("path", destinationFolder))

	destinationFile, err := os.Create(destinationFilePath)
	assert.AssertErrNil(ctx, err, "Failed creating file", slog.String("path", destinationFilePath))
	defer destinationFile.Close()

	_, err = destinationFile.Write(content)
	assert.AssertErrNil(ctx, err, "Failed writing YAML marshalled Cue value to file", slog.String("path", destinationFilePath))
}

// Returns the value of the node at the given path from the given root node, as string.
func getNodeStringValueAtPath(ctx context.Context, rootNode cue.Value, path string) string {
	node := rootNode.LookupPath(cue.ParsePath(path))
	assert.Assert(ctx, node.Exists(), "Node doesn't exist", slog.String("node-path", path))

	nodeStringValue, err := node.String()
	assert.AssertErrNil(ctx, err, "Failed getting node value as string", slog.String("node-path", path))

	return nodeStringValue
}

// Returns the value of the node at the given path from the given root node, as bool.
func getNodeBooleanValueAtPath(ctx context.Context, rootNode cue.Value, path string) bool {
	node := rootNode.LookupPath(cue.ParsePath(path))
	assert.Assert(ctx, node.Exists(), "Node doesn't exist", slog.String("node-path", path))

	nodeBooleanValue, err := node.Bool()
	assert.AssertErrNil(ctx, err, "Failed getting node value as boolean", slog.String("node-path", path))

	return nodeBooleanValue
}

func printCueValue(ctx context.Context, v cue.Value) {
	yamlEncodedCueValue, err := cueToYAML.Encode(v)
	assert.AssertErrNil(ctx, err, "Failed YAML marshalling Cue value")

	println(string(yamlEncodedCueValue))
}
