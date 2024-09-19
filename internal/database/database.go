package database

import (
	"database/sql"
	_ "github.com/lib/pq"
)

var db *sql.DB

func InitDB() {
    var err error
    db, err = sql.Open("postgres", "postgres://wb_admin:1234@localhost/wb_orders")
    if err != nil {
        panic(err)
    }

    if err = db.Ping(); err != nil {
        panic(err)
    }

}

func CloseOrderModel() {
    db.Close()
}

func GetDB() *sql.DB {
    return db
}

