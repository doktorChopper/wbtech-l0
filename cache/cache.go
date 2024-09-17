package cache

import "sync"


type Cache struct {
    sync.RWMutex
    items   map[string]Item
}

type Item struct {
    Value   interface{}
}
