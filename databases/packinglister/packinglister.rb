require 'sqlite3'
require 'io/console'

class PackingList

	attr_reader :user_id, :list_id
	attr_accessor :packing_list, :destination, :departure_date

	def initialize(database, userid, list_id, imported_list)
		@db = database
		@db.results_as_hash = true
		@destination = @db.execute("SELECT destination FROM lists where id = ?", [list_id])[0]["destination"]
		@departure_date = @db.execute("SELECT depart_date FROM lists where id = ?", [list_id])[0]["depart_date"]
		@user_id = userid
		@list_id = list_id
		@packing_list = imported_list
	end

end


# Greet user
# create new database, results as hash true
# define SQL queries to create tables for users and lists
# users table - (id int primary key, name varchar, pin integer)
# lists table - (id int primary key, destination varchar, depart_date varchar, items blob, user_id int, foreign key user_id=users(id))
# execute command to create users table, then command to create lists table


system "clear"
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
			selected_user = gets.chomp
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
		new_pin = STDIN.noecho(&:gets).chomp
		puts "Please re-enter your PIN."
		verify_pin = STDIN.noecho(&:gets).chomp

		if new_pin != verify_pin
			puts "Your PIN entries did not match. Please try again."
		end
	end

	db.execute("INSERT INTO users (name, pin) VALUES (?, ?)", [new_username, new_pin])
	puts "Welcome, #{new_username}. Let's get started creating a new packing list."
	selected_user = db.execute("SELECT MAX(id) FROM users")[0]["MAX\(id\)"]

else
	# need to verify pin
	puts "Please enter your PIN."
	actual_pin = db.execute("SELECT pin FROM users WHERE id = ?", [selected_user])[0]["pin"].to_i
	check_pin = nil
	until check_pin.to_i == actual_pin
		check_pin = STDIN.noecho(&:gets).chomp
		if check_pin.to_i != actual_pin
			puts "Invalid PIN. Please try again."
		end
	end

	# get all this user's lists - each list will be an array - index 0 id, 1 dest, 2 date, 3 list-blob
	get_user_lists_cmd = "SELECT id, destination, depart_date FROM lists WHERE user_id = ?"

	all_user_lists = db.execute(get_user_lists_cmd, [selected_user])
	# make array of valid list IDs
	valid_list_ids = []
	all_user_lists.each { | individual_list |  valid_list_ids << individual_list["id"] }

	if all_user_lists.empty?
		system "clear"
		puts "You don't have any saved lists. Let's create a new one!"
		create_new_list = true
	else
		system "clear"
		puts "Here are your saved lists:"
		puts "LIST ID .. DESTINATION .. DEPARTURE DATE"

		all_user_lists.each do  | individual_list |
			puts "#{individual_list['id']} .. #{individual_list['destination']} .. #{individual_list['depart_date']}"
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
			create_new_list = false
		else
			create_new_list = true
		end

	end
end

create_new_list_cmd = "INSERT INTO lists (destination, depart_date, items, user_id) VALUES (?, ?, ?, ?)"

if create_new_list
	# get all info for new list
	puts "Please enter the destination."
	destination_input = gets.chomp
	puts "Please enter the departure date in the format yyyy-mm-dd." # add code to test format if you have time, otherwise nbd
	departure_input = gets.chomp
	db.execute(create_new_list_cmd, [destination_input, departure_input, {}.to_s, selected_user])
	list_to_load = db.execute("SELECT MAX(id) FROM lists")[0]["MAX(id)"]
end

# get info from list to feed into new class instance

list_data = db.execute("SELECT * FROM lists WHERE id = ?", [list_to_load])

active_list = PackingList.new(db, selected_user, list_data[0]["id"], eval(list_data[0]["items"]) )

# initialize list
# loop: display list of commands for user: mark complete, add to to list, remove from list, update date, update destination, delete active list and quit, save changes and quit, quit without saving

loop do
	system "clear"

	if active_list.packing_list.empty?
		puts "Your packing list for your trip to #{active_list.destination} departing #{active_list.departure_date}"
		puts "is currently empty."

	else
		puts "Your packing list for your trip to #{active_list.destination} departing #{active_list.departure_date}:"

		active_list.packing_list.each do | list_item, is_done |
			if is_done
				puts "[x] #{list_item}"
			else
				puts "[ ] #{list_item}"
			end
		end

	end

	puts ""
	puts "Please select an option:"
	puts "(a)dd item to list, (m)ark item complete, (d)elete list and quit,"
	puts "(r)emove item from list, (q)uit without saving,"
	puts "(c)hange departure date, (u)pdate destination, (s)ave and quit"

	valid_operations = "amdcusrq"
	user_instruction = gets.chomp

	if !valid_operations.chars.include?(user_instruction.downcase)
		until "amdcusrq".chars.include?(user_instruction.downcase)
			system "clear"
			puts "Invalid operation. Valid operations are:"
			puts "(a)dd item to list, (m)ark item complete, (d)elete list and quit,"
			puts "(r)emove item from list, (q)uit without saving,"
			puts "(c)hange departure date, (u)pdate destination, (s)ave and quit"
			puts "Please try again."
			user_instruction = gets.chomp
		end

	elsif user_instruction.downcase == "a"
		# add item to list
		puts "Please enter the item to add to the list"
		new_item = gets.chomp
		active_list.packing_list[new_item] = false

	elsif user_instruction.downcase == "m"
		#mark item complete
		puts "Which item is now complete?"
		finally_finished = gets.chomp

		if active_list.packing_list.has_key?(finally_finished)
			active_list.packing_list[finally_finished] = true
		else
			system "clear"
			puts "Sorry, I couldn't find that on your list."
			sleep 1
		end
	
	elsif user_instruction.downcase == "r"
		puts "Which item are you removing?"
		to_remove = gets.chomp

		if active_list.packing_list.has_key?(to_remove)
			active_list.packing_list.delete(to_remove)
		else
			system "clear"
			puts "Sorry, I couldn't find that on your list."
			sleep 1
		end

	elsif user_instruction.downcase == "q"
		if create_new_list
			db.execute("DELETE from lists where id = ?", [list_to_load])
		end
		puts "Ciao!"
		abort	

	elsif user_instruction.downcase == "d"
		# delete list and quit - may need to group this with (s) so break works on all loops - test this
		db.execute("DELETE from lists where id = ?", [list_to_load])
		puts "Ta ta, dahling! :*"
		abort

	elsif user_instruction.downcase == "c"
		#change departure date
		puts "Please enter your new departure date: yyyy-mm-dd"
		active_list.departure_date= gets.chomp # add test for valid format if enough time


	elsif user_instruction.downcase == "u"
		#update destination
		puts "Please enter your new destination."
		active_list.destination= gets.chomp


	elsif user_instruction.downcase == "s"
		db.execute("UPDATE lists SET destination = ?, depart_date = ?, items = ?, user_id = ? where id = ?", [active_list.destination, active_list.departure_date, active_list.packing_list.to_s, active_list.user_id.to_i, active_list.list_id.to_i])
		system "clear"
		puts "Bon Voyage!"
		sleep 3
		abort
	end

end