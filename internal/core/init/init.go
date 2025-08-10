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

package init

import (
	"bytes"
	"context"
	"embed"
	"html/template"
	"io/fs"
	"log/slog"
	"os"
	"path"
	"strings"

	"github.com/Archisman-Mridha/kue/internal/utils"
	"github.com/Archisman-Mridha/kue/internal/utils/assert"
	"github.com/Archisman-Mridha/kue/internal/utils/logger"
)

//go:embed templates/*
var templates embed.FS

type (
	TemplateValues struct {
		CueModName,
		RepoURL,
		KueProjectPath string
	}

	InitKueProjectArgs struct {
		Directory,

		CueModName,
		RepoURL,
		KueProjectPath string
	}
)

func InitKueProject(ctx context.Context, args *InitKueProjectArgs) {
	templateValues := &TemplateValues{
		CueModName:     args.CueModName,
		RepoURL:        args.RepoURL,
		KueProjectPath: args.KueProjectPath,
	}

	// For each template.
	_ = fs.WalkDir(templates, "templates",
		func(templateName string, entry fs.DirEntry, _ error) error {
			if entry.IsDir() {
				return nil
			}

			scopedCtx := logger.AppendSlogAttributesToCtx(ctx, []slog.Attr{
				slog.String("name", templateName),
			})

			// Execute the template.

			templateContent, err := templates.ReadFile(templateName)
			assert.AssertErrNil(scopedCtx, err, "Failed reading template")

			parsedTemplate, err := template.New(templateName).Parse(string(templateContent))
			assert.AssertErrNil(scopedCtx, err, "Failed parsing template")

			var executedTemplate bytes.Buffer
			err = parsedTemplate.Execute(&executedTemplate, templateValues)
			assert.AssertErrNil(scopedCtx, err, "Failed executing template")

			// Write out the template execution result.

			outputFilePath, _ := strings.CutPrefix(templateName, "templates/")
			outputFilePath = path.Join(args.Directory, outputFilePath)

			utils.CreateIntermediateDirsForFile(scopedCtx, outputFilePath)

			outputFile, err := os.OpenFile(outputFilePath,
				os.O_CREATE|os.O_WRONLY|os.O_TRUNC,
				0o600,
			)
			assert.AssertErrNil(scopedCtx, err, "Failed opening output file")
			//nolint:errcheck
			defer outputFile.Close()

			_, err = outputFile.Write(executedTemplate.Bytes())
			assert.AssertErrNil(scopedCtx, err,
				"Failed writing template execution result to output file",
			)

			return nil
		},
	)
}
