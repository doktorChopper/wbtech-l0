package main

import (
	"log"
	"net/http"
)


func showOrderByID(w http.ResponseWriter, r * http.Request) {
    if r.Method != http.MethodGet {
        w.Header().Set("Allow", http.MethodGet)
        return
    }
    w.Write([]byte("OrderID: lalala"))
}

func main() {

    mux := http.NewServeMux()
    mux.HandleFunc("/", showOrderByID)

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
