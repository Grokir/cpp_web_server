#!/bin/sh
# Create database
cat ./creates/createDB.sql | PGPASSWORD=postgres psql -h localhost -U postgres -d postgres;
# Create table
cat ./creates/create_table_script.sql | PGPASSWORD=postgres psql -h localhost -U postgres -d book_crossing;

# Insert data
cat ./inserts/insert_standart_data.sql  | PGPASSWORD=postgres psql -h localhost -U postgres -d book_crossing;
cat ./inserts/insert_test_data.sql | PGPASSWORD=postgres psql -h localhost -U postgres -d book_crossing;