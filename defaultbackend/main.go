package main

import (
	"io/ioutil"
	"log"
	"net/http"

	"github.com/labstack/echo"
)

func main() {
	content, err := ioutil.ReadFile("static/index.html")
	if err != nil {
		log.Fatal(err)
	}
	e := echo.New()
	e.GET("/healthz", func(c echo.Context) error {
		return c.String(http.StatusOK, "ok")
	})
	e.GET("/", func(c echo.Context) error {
		return c.HTML(http.StatusNotFound, string(content))
	})
	e.File("/favicon.ico", "static/favicon.ico")
	e.Logger.Fatal(e.Start(":8080"))
}
