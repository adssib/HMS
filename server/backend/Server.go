package main

import (
 "fmt"
 "log"
 "net/http"
)

func main() {
 fmt.Println("Starting Server...")
 http.HandleFunc("/", handler)
 log.Fatal(http.ListenAndServe(":8080", nil))
}

func handler(w http.ResponseWriter, r *http.Request) {
 fmt.Fprint(w, "Hello, World!")
}