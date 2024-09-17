package main

import (
	"strconv"
	"time"

	"github.com/nats-io/stan.go"
)

func main() {

    sc, _ := stan.Connect("prod", "simple-pub")
    defer sc.Close()

    for i := 1; ; i++ {
        sc.Publish("test", []byte("test " + strconv.Itoa(i)))
        time.Sleep(2 * time.Second)
    }

}
