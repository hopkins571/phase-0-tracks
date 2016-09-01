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
