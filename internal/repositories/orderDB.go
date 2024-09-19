package repositories

import (
    "github.com/doktorChopper/wbtech-l0/internal/database"
    "github.com/doktorChopper/wbtech-l0/internal/models"
    "log"
)

func GetOrder(id int, order * models.Order) error {
    stmt := `SELECT * FROM orders WHERE id = $1`

    db := database.GetDB()

    rows, err := db.Query(stmt, id)
    if err != nil {
        log.Fatal(err)
        return err
    }
    defer rows.Close()

    for rows.Next() {
        if err := rows.Scan(&order.ID, &order.Data); err != nil {
            log.Fatal(err)
            return err
        }
    }

    if err := rows.Err(); err != nil {
        log.Fatal(err)
        return err
    }

    return nil
}

func InsertOrder(order string) (int, error) {
    stmt := `INSERT INTO orders(order) VALUES($1)`

    db := database.GetDB()

    res, err := db.Exec(stmt, order)
    if err != nil {
        log.Fatal(err.Error())
        return 0, err
    }

    id, err := res.LastInsertId()
    if err != nil {
        return 0, err
    }

    return int(id), nil
}
