# Greet user, create blank hash, ask for first input - client name
puts "Welcome!"
puts "Please enter the client's name."
form = {}
form[:name] = gets.chomp
# Second input - age - create loop until valid age is entered, make sure string is converted to integer
puts "Please enter the client's age."
valid_age = false
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
# Extra string input for decor theme
puts "Please enter the decor theme."
form[:decor] = gets.chomp
# Input for area of of residence - convert to integer, nil if unknown
puts "How many square feet in the residence? Enter unknown if unknown."
valid_area = false
until valid_area == true
	form[:area] = gets.chomp
	if form[:area].to_i < 0
		puts "I'm sorry. That response was invalid."
	elsif form[:area].downcase == "unknown"
		form[:area] = nil
		valid_area = true
	else
		form[:area] = form[:area].to_i
		valid_area = true
	end
end
# Create y/n input if new client was referred by existing client
# If referred true, follow up with referred by input
puts "Was this client referred by another client? (y/n)"
refer_input = gets.chomp
valid_refer = false
until valid_refer == true	
	if refer_input.downcase == "n"
		form[:referred] = false
		form[:referred_by] = nil
		valid_refer = true
	elsif refer_input.downcase == "y"
		form[:referred] = true
		puts "Enter the referring client."
		form[:referred_by] = gets.chomp
		valid_refer = true
	else
		puts "That was an invalid response. Please try again."
	end
end
# Print contents of hash
puts "Here is what you gave me."
puts form
# Input if user would like to change anything - if false, print hash again
validresp = false
until validresp == true
	puts "Would you like to update anything? (y/n)"
	update_resp = gets.chomp
	if update_resp.downcase == "n"
		validresp = true
# Elsif true, ask user which field is to be updated, set new variable
	elsif update_resp.downcase == "y"
		puts "Which field would you like to update?"
		update_field = gets.chomp
# Get new value of field to be updated
		puts "What should the new value of #{update_field} be?"
		update_entry = gets.chomp
# If field to be updated is area, kids or age, must convert new input to integer when overwriting value
		if update_field == "area" || update_field == "kids" || update_field == "age"
			form[update_field.to_sym] = update_entry.to_i
			validresp = true
		else
			form[update_field.to_sym] = update_entry
			validresp = true
		end		
# Handle invalid user input
	else
		puts "Your response was invalid. Please try again."
	end
end
# Print hash with new data
puts "Thank you. Your entries are confirmed as follows:"
puts form
