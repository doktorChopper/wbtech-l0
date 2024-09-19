package cache

import (
	"sync"
	"time"
)


type Cache struct {
    sync.RWMutex
    items           map[string]Item
}

type Item struct {
    Value           interface{}
    Created         time.Time
}


func New() *Cache {
    
    items := make(map[string]Item)

    c := Cache{
        items:      items,
    }

    return &c
}


func (c *Cache) Set(key string, value interface{}) {

    c.Lock()

    defer c.Unlock()
    
    c.items[key] = Item{
        Value:      value,
        Created:    time.Now(),
    }
}
