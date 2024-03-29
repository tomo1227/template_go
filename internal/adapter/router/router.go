package router

import (
	"fmt"
	"log/slog"
	"os"

	"github.com/gofiber/fiber/v2"
	"github.com/tomo1227/template_golang/internal/adapter/handler"
	"github.com/tomo1227/template_golang/internal/infrastructure/logger"
	"go.uber.org/dig"
)

type Router struct {
	Fiber *fiber.App
}

func NewRouter() (*Router, error) {
	router := &Router{
		Fiber: fiber.New(),
	}

	err := router.registerRoutes()
	if err != nil {
		return nil, fmt.Errorf("failed to register routes: %w", err)
	}
	return router, nil
}

func (router *Router) registerRoutes() error {
	l := slog.New(slog.NewTextHandler(os.Stdout, nil))

	router.Fiber.Use(func(c *fiber.Ctx) error {
		c.Locals("logger", l)
		return c.Next()
	})
	c := dig.New()
	c.Provide(logger.NewLogger)
	c.Provide(handler.NewFiberHandler)
	router.Fiber.Get("hello", func(ctx *fiber.Ctx) error {
		return c.Invoke(func(h handler.FiberHandler) {
			h.Greet(ctx)
		})
	})
	return nil
}
