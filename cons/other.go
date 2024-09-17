package main

import (
	"fmt"
	"sync"

	"github.com/nats-io/stan.go"
)


func Block() {
    w := sync.WaitGroup{}
    w.Add(1)
    w.Wait()
}

func main() {
    sc, _ := stan.Connect("prod", "sub-1")
    defer sc.Close()

    sc.Subscribe("test", func(m *stan.Msg) {
        fmt.Printf("Got: #{string(m.Data)}\n")
    })

    Block()
}
