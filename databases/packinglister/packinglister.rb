require_relative 'packinglister_methods'
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

# define empty hash all_users
# use sql query to get id and name for all users
# insert all of these into all_users: ids are the keys, names are values

all_users = {}
db.execute("SELECT id, name FROM users").each do |user|
	all_users[user["id"].to_s] = user["name"]
end

# select existing user or create new user?
# IF all_users isn't empty:
# 	print userid and name of each user
# 	user to enter their user id or enter 'new' to register as new user
# 	def boolean variable create_new_user, set to nil
# 	UNTIL create_new_user isn't nil
# 		IF user input is a valid userid, THEN create_new_user = true
# 		ELSIF user input is "new", THEN create_new_user = false
# 		ELSE user input must be invalid, display error message, create_new_user is still nil, must loop and try again
# ELSE (all_users IS empty), THEN create_new_user = true

if !all_users.empty?
	puts "USER ID .. USER NAME"
	all_users.each do | user_id, user_name |
		puts "#{user_id} .. #{user_name}"
	end
	puts "Please enter your user id to continue or enter 'new' to create a new user."
	selected_user = gets.chomp
	create_new_user = nil
	until create_new_user != nil
		if all_users.has_key?(selected_user)
			create_new_user = false
		elsif selected_user.downcase == "new"
			create_new_user = true
		else
			puts "Invalid input. Try again."
		end
	end
# if there are no 
else
	create_new_user = true
end
