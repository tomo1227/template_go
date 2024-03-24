package handler

import "github.com/gofiber/fiber/v2"

func RegisterHandlers(router *fiber.App) {

	router.Get("/hello", func(ctx *fiber.Ctx) error {
		return ctx.SendString("Hello, World!")
	})
}
