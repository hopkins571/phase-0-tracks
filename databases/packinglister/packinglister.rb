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
			create_new_list = true
		else
			puts "Invalid input. Try again."
		end
	end
# if there are no 
else
	create_new_user = true
	create_new_list = true
end

if create_new_user
	puts "Please enter your name:"
	new_username = gets.chomp # create and run method to check if name valid?
	new_pin = nil
	verify_pin = []

	until new_pin == verify_pin
		puts "Please enter a PIN."
		new_pin = gets.chomp
		puts "Please re-enter your PIN."
		verify_pin = gets.chomp

		if new_pin != verify_pin
			puts "Your PIN entries did not match. Please try again."
		end
	end

	db.execute("INSERT INTO users (name, pin) VALUES (?, ?)", [new_username, new_pin])
	puts "Welcome, #{new_username}. Let's get started creating a new packing list."

else
	# need to verify pin
	puts "Please enter your PIN."
	actual_pin = db.execute("SELECT pin FROM users WHERE id = ?", [selected_user])[0]["pin"].to_i
	check_pin = nil
	until check_pin.to_i == actual_pin
		check_pin = gets.chomp
		if check_pin.to_i != actual_pin
			puts "Invalid PIN. Please try again."
		end
	end

	# get all this user's lists - each list will be an array - index 0 id, 1 dest, 2 date, 3 list-blob
	all_user_lists = db.execute("SELECT id, destination, depart_date FROM lists WHERE user_id = ?", [selected_user])
	# make array of valid list IDs
	valid_list_ids = []
	all_user_lists.each { | individual_list |  valid_list_ids << individual_list["id"] }
	# p all_user_lists.class
	# p all_user_lists[0]
	# p valid_list_ids
	# p all_user_lists
	if all_user_lists.empty?
		puts "You don't have any saved lists. Let's create a new one!"
		create_new_list = true
	else
		puts "Here are your saved lists:"
		puts "LIST ID .. DESTINATION .. DEPARTURE DATE"
		all_user_lists.each do  | individual_list |
			puts "#{individual_list['id']} .. #{individual_list['destination']} .. #{individual_list['depart_date']}"
		end
	end


	puts "Please enter the ID of the list you'd like to access."
	puts "Or enter 'new' to create a new list."

	list_to_load = gets.chomp

	validresponse = false

	if list_to_load.downcase == "new" || valid_list_ids.include?(list_to_load.to_i)
		validresponse = true
	end

	if !validresponse
		
		until valid_list_ids.include?(list_to_load.to_i) || list_to_load.downcase == "new"
			puts "Sorry, that wasn't a valid list ID. Enter the list ID or 'new' to create a new list."
			list_to_load = gets.chomp
		end
	end

	if list_to_load.downcase != "new"
		#time to pass all the info from the existing list into the a new class instance, yay!
	else
		#prompt user for new list info, create new class instance with this info, yay!
	end

end

