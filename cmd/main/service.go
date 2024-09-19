package main

import (
	"log"
	"net/http"

	"github.com/doktorChopper/wbtech-l0/internal/database"
	"github.com/doktorChopper/wbtech-l0/internal/handlers"
)

func main() {

    mux := http.NewServeMux()
    mux.HandleFunc("/order/show", handlers.ShowOrder)
   // mux.HandleFunc("/order/create", createOrder)

    database.InitDB()

    srv := &http.Server{
        Addr: ":8080",
        Handler: mux,
    }

    log.Println("launch server on port 8080")
    err := srv.ListenAndServe()
    if err != nil {
        log.Fatal(err)
    }

}
