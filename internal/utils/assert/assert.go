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

package assert

import (
	"context"
	"log/slog"
	"os"
	"reflect"

	"github.com/Archisman-Mridha/kue/internal/utils/logger"
)

// Panics if the given error isn't nil.
func AssertErrNil(ctx context.Context, err error, customErrorMessage string, attributes ...any) {
	if err == nil {
		return
	}

	attributes = append(attributes, logger.Error(err))
	slog.ErrorContext(ctx, customErrorMessage, attributes...)
	os.Exit(1)
}

// Panics if the given value isn't nil.
func AssertNil(ctx context.Context, value any, errorMessage string, attributes ...any) {
	if value == nil {
		return
	}

	slog.ErrorContext(ctx, errorMessage, attributes...)
	os.Exit(1)
}

// Panics if the given value is nil.
func AssertNotNil(ctx context.Context, value any, errorMessage string, attributes ...any) {
	if (value != nil) && !reflect.ValueOf(value).IsNil() {
		return
	}

	slog.ErrorContext(ctx, errorMessage, attributes...)
	os.Exit(1)
}

// Panics if the given value is false.
func Assert(ctx context.Context, value bool, errorMessage string, attributes ...any) {
	if value {
		return
	}

	slog.ErrorContext(ctx, errorMessage, attributes...)
	os.Exit(1)
}
