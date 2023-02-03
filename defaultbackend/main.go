package main

import (
	"log"
	"net/http"
	"os"

	"github.com/labstack/echo/v4"
)

func customHTTPErrorHandler(err error, c echo.Context) {
	c.Redirect(302, "/")
}

func main() {
	content, err := os.ReadFile("static/index.html")
	if err != nil {
		log.Fatal(err)
	}
	e := echo.New()
	e.HTTPErrorHandler = customHTTPErrorHandler
	e.GET("/healthz", func(c echo.Context) error {
		return c.String(http.StatusOK, "ok")
	})
	e.GET("/", func(c echo.Context) error {
		return c.HTML(http.StatusNotFound, string(content))
	})
	e.File("/favicon.ico", "static/favicon.ico")
	e.Logger.Fatal(e.Start(":8080"))
}
