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

package config

import (
	"context"
	"os"

	goValidator "github.com/go-playground/validator/v10"
	goNonStandardValidtors "github.com/go-playground/validator/v10/non-standard/validators"
	"gopkg.in/yaml.v3"

	"github.com/Archisman-Mridha/kue/internal/constants"
	"github.com/Archisman-Mridha/kue/internal/utils/assert"
)

// Parses and validates the Kue config file in the current directory.
// The parsed config is stored in ParsedConfig.
func MustParseConfigFile(ctx context.Context) {
	configFileContents, err := os.ReadFile(constants.KueConfigFileName)
	assert.AssertErrNil(ctx, err, "Failed reading Kue config file")

	ParsedConfig = MustParseConfig(ctx, configFileContents)
}

// Parses and validates the given unmarshalled config.
// The parsed config is then returned.
func MustParseConfig(ctx context.Context, unparsedConfig []byte) *Config {
	config := new(Config)

	err := yaml.Unmarshal(unparsedConfig, config)
	assert.AssertErrNil(ctx, err, "Failed YAML unmarshalling config")

	// Validate based on struct tags.
	{
		validator := goValidator.New(goValidator.WithRequiredStructEnabled())

		err = validator.RegisterValidation("notblank", goNonStandardValidtors.NotBlank)
		assert.AssertErrNil(ctx, err, "Failed registering notblank validator")

		err = validator.Struct(config)
		assert.AssertErrNil(ctx, err, "Config validation failed")
	}

	return config
}
