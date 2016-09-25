require relative 'packinglister_methods'
require 'sqlite3'

# Greet user
# create new database, results as hash true
# define SQL queries to create tables for users and lists
# users table - (id int primary key, name varchar, pin integer)
# lists table - (id int primary key, destination varchar, depart_date varchar, items blob, user_id int, foreign key user_id=users(id))
# execute command to create users table, then command to create lists table

puts "Welcome to Packinglister!"
db = SQLite3::Database.new("packing_lists.db")
db.results_as_hash = true
create_users_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY,
    name VARCHAR(20),
    pin INTEGER(4)
  )
SQL

create_lists_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS lists (
    id INTEGER PRIMARY KEY,
    destination VARCHAR(20),
    depart_date VARCHAR(10),
    items BLOB,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id)
  )
SQL

db.execute(create_users_table_cmd)
db.execute(create_lists_table_cmd)

