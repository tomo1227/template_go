// mainパッケージは、Fiberフレームワークを使用してシンプルなHTTPサーバーを作成します。
package main

import (
	"github.com/gofiber/fiber/v2"
)

// main関数は、HTTPサーバーを起動し、"/health"エンドポイントを設定します。
func main() {
	app := fiber.New()

	// GETリクエストに応答するための"/health"エンドポイントを設定します。
	// レスポンスとしてJSON形式でステータス情報を返します。
	app.Get("/health", func(c *fiber.Ctx) error {
		return c.JSON(fiber.Map{
			"status": "OK!",
		})
	})

	// サーバーをポート8080でリッスンします。
	app.Listen(":8080")
}
