package handlers

import (
	"encoding/json"
	"log"
	"net/http"
	"strconv"

	"github.com/doktorChopper/wbtech-l0/internal/models"
	"github.com/doktorChopper/wbtech-l0/internal/repositories"
)

func ShowOrder(w http.ResponseWriter, r * http.Request) {

    w.Header().Set("Content-Type", "application/json")


    if r.Method != http.MethodGet {
        w.Header().Set("Allow", http.MethodGet)
        return
    }

    id, err := strconv.Atoi(r.URL.Query().Get("id"))
    if err != nil {
        log.Fatal(err)
        return
    }

    var o models.Order

    err = repositories.GetOrder(id, &o)
    if err != nil {
        log.Fatal(err)
        return
    }

    json.NewEncoder(w).Encode(o)
}
