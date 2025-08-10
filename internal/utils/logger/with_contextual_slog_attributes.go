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

package logger

import (
	"context"
	"log/slog"
)

type SlogAttributesCtxKey struct{}

var slogAttributesCtxKey = SlogAttributesCtxKey{}

type ContextualSlogAttributesHandler struct {
	slog.Handler
}

// Retrieves slog attributes present in the context and appends them to the slog record (log event).
// The slog handler is then invoked with the modified record.
// We do this to print out the contextual slog attributes.
func (h *ContextualSlogAttributesHandler) Handle(ctx context.Context, record slog.Record) error {
	if attributes, ok := ctx.Value(slogAttributesCtxKey).([]slog.Attr); ok {
		for _, attribute := range attributes {
			record.AddAttrs(attribute)
		}
	}

	return h.Handler.Handle(ctx, record)
}

func withContextualSlogAttributesHandler(handler slog.Handler) *ContextualSlogAttributesHandler {
	return &ContextualSlogAttributesHandler{
		handler,
	}
}

// Appends slog attributes to the given context. The modified context is then returned.
func AppendSlogAttributesToCtx(ctx context.Context, attributes []slog.Attr) context.Context {
	if ctx == nil {
		ctx = context.Background()
	}

	existingSlogAttributes, ok := ctx.Value(slogAttributesCtxKey).([]slog.Attr)
	if !ok {
		existingSlogAttributes = []slog.Attr{}
	}
	existingSlogAttributes = append(existingSlogAttributes, attributes...)
	return context.WithValue(ctx, slogAttributesCtxKey, existingSlogAttributes)
}
