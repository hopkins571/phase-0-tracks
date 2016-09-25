require 'sqlite3'
require 'faker'

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

random_lists = []
200.times { random_lists << Hash.new }

2100.times { random_lists[(0..199).to_a.sample][Faker::Hipster.word] = [true,false].sample }

50.times { db.execute("INSERT INTO users (name, pin) VALUES (?, ?)",[Faker::Name.name, 0000]) }
random_lists.each { | hipster | db.execute("INSERT INTO lists (destination, depart_date, items, user_id) VALUES (?, ?, ?, ?)", [Faker::Address.country.to_s, Faker::Date.forward(365).to_s, hipster.to_s, (1..50).to_a.sample]) }




