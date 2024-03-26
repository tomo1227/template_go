// Code generated by Wire. DO NOT EDIT.

//go:generate go run -mod=mod github.com/google/wire/cmd/wire
//go:build !wireinject
// +build !wireinject

package injector

import (
	"github.com/tomo1227/template_golang/internal/adapter/handler"
	"github.com/tomo1227/template_golang/internal/infrastructure/logger"
)

// Injectors from wire.go:

func InjectHandler() handler.FiberHandler {
	slogLogger := logger.NewLogger()
	fiberHandler := handler.NewFiberHandler(slogLogger)
	return fiberHandler
}
