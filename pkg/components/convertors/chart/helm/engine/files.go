/*
Copyright The Helm Authors.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

package engine

import "helm.sh/helm/v3/pkg/chart"

// files is a map of files in a chart that can be accessed from a template.
type files map[string][]byte

// NewFiles creates a new files from chart files.
// Given an []*chart.File (the format for files in a chart.Chart), extract a map of files.
func newFiles(from []*chart.File) files {
	files := make(map[string][]byte)
	for _, f := range from {
		files[f.Name] = f.Data
	}
	return files
}
