# Greet user, create blank hash, ask for first input - client name
puts "Welcome!"
puts "Please enter the client's name."
form = {}
form[:name] = gets.chomp
# Second input - age - create loop until valid age is entered, make sure string is converted to integer
until valid_age == true
	form[:age] = gets.chomp.to_i
	if form[:age] <= 0
		puts "I'm sorry. That response was invalid."
	else
		valid_age = true
	end
end
# Second input - number of kids - create loop until valid age entered
# convert string input to integer
# give user option for unknown - if unknown, change value to nil
puts "How many kids do they have? Enter unknown if unknown."
valid_kids = false
until valid_kids == true
	form[:kids] = gets.chomp
	if form[:kids].to_i < 0
		puts "I'm sorry. That response was invalid."
	elsif form[:kids].downcase == "unknown"
		form[:kids] = nil
		valid_kids = true
	else
		form[:kids] = form[:kids].to_i
		valid_kids = true
	end
end