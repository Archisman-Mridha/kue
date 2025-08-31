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

package utils

import (
	"context"
	"log/slog"
	"os/exec"

	"github.com/Archisman-Mridha/kue/internal/utils/assert"
)

// Executes the given command.
// When command execution fails, it doesn't panic, and rather returns the error back to the caller.
func ExecuteCommand(ctx context.Context, command string) (string, error) {
	return executeCommand(ctx, command, false)
}

// Executes the given command.
// Panics if the command execution fails.
func MustExecuteCommand(ctx context.Context, command string) string {
	output, _ := executeCommand(ctx, command, true)
	return output
}

func executeCommand(ctx context.Context, command string, panicOnFailure bool) (string, error) {
	slog.DebugContext(ctx, "Executing command", slog.String("command", command))

	output, err := exec.Command("bash", "-c", command).CombinedOutput()

	if panicOnFailure {
		assert.AssertErrNil(ctx, err,
			"Command execution failed",
			slog.String("output", string(output)),
		)
	}

	// Print out command execution output (if any).
	if len(output) > 0 {
		slog.DebugContext(ctx, "Command executed", slog.String("output", string(output)))
	}

	return string(output), err
}
