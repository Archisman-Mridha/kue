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

package constants

// Temporary directory used by Kue.
//
// During CueLang schema generation from CRDs stored in a git repository,
// the git repository gets cloned here temporarily.
const TempDirPath = "/tmp/kue"

// CLI flags.
const (
	FlagNameDebug = "debug"

	FlagNameRepositoryURL = "repository-url"
	FlagNameDirectoryPath = "directory-path"
	FlagNameCueModPath    = "cue-mod-path"

	FlagNameCueModRoot       = "cue-mod-root"
	FlagNameCueInstance      = "cue-instance"
	FlagNameOutputsDirectory = "outputs-directory"
)

// CueLang field attributes.
const (
	FieldAttributeApp = "app"
)

// CueLang AST node labels.
const (
	ASTNodeLabelAPIVersion = "apiVersion"
	ASTNodeLabelKind       = "kind"

	ASTNodeLabelHelmInstallation = "helmInstallation"
	ASTNodeLabelValues           = "values"
)

// CueLang AST paths.
const (
	ASTPathMetadataName      = "metadata.name"
	ASTPathMetadataNamespace = "metadata.namespace"

	ASTPathRepoURL = "repoURL"
	ASTPathChart   = "chart"
	ASTPathVersion = "version"

	ASTPathReleaseName = "releaseName"
	ASTPathNamespace   = "namespace"

	ASTPathValues = "values"
)
