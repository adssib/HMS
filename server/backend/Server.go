package main

import (
	"database/sql"
	"fmt"
	"log"
	"os"
	_ "github.com/denisenkom/go-mssqldb"
	"github.com/joho/godotenv"
)

func main() {
	// Load environment variables from the .env file
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}

	// Get database credentials from environment variables
	dbUser := os.Getenv("DB_USER")
	dbPassword := os.Getenv("DB_PASSWORD")
	dbName := os.Getenv("DB_NAME")
	dbServer := os.Getenv("DB_SERVER")

	// Construct the connection string
	connString := fmt.Sprintf("server=%s;user id=%s;password=%s;database=%s", dbServer, dbUser, dbPassword, dbName)

	// Open a connection to the database
	db, err := sql.Open("mssql", connString)
	if err != nil {
		log.Fatal("Error opening connection: ", err.Error())
	}
	defer db.Close()

	// Ping the database to ensure the connection is successful
	err = db.Ping()
	if err != nil {
		log.Fatal("Error pinging the database: ", err.Error())
	}

	fmt.Println("Successfully connected to the database!")

	// Query the Guest table for the top 3 rows
	rows, err := db.Query("SELECT TOP 3 guest_id, first_name, last_name FROM Guest")
	if err != nil {
		log.Fatal("Error running query: ", err.Error())
	}
	defer rows.Close()

	// Iterate over the result set
	for rows.Next() {
		var guest_id int
		var first_name, last_name string

		// Scan the row values into the variables
		err := rows.Scan(&guest_id, &first_name, &last_name)
		if err != nil {
			log.Fatal("Error scanning row: ", err.Error())
		}

		// Print the results
		fmt.Printf("Guest ID: %d, First Name: %s, Last Name: %s\n", guest_id, first_name, last_name)
	}

	// Check for errors after iterating over rows
	err = rows.Err()
	if err != nil {
		log.Fatal("Error iterating rows: ", err.Error())
	}
}
