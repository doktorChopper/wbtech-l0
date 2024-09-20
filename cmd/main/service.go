package main

import (
	"log"
	"os"
	"os/signal"
	"syscall"

	"github.com/doktorChopper/wbtech-l0/internal/database"
	"github.com/doktorChopper/wbtech-l0/internal/server"
)

func main() {

    database.InitDB()

    go func() {
        err := server.StartServer()
        log.Println("Launch server on port 8080 ...")
        if err != nil {
            log.Fatalf("Failde to start server: %v", err)
        }
    } ()

    signalCh := make(chan os.Signal, 1)
    signal.Notify(signalCh, syscall.SIGINT, syscall.SIGTERM)
    <-signalCh

}
