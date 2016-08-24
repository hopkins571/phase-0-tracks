puts "What is your name?"
name = gets.chomp
puts "What is your age in years?"
age = gets.chomp.to_i
puts "In what year were you born?"
birthyear = gets.chomp.to_i
gb_order = nil
until gb_order != nil
	puts "Our company cafeteria serves garlic bread."
	puts "Would you like us to order some for you? (y/n)"
	gb_input = gets.chomp
	if gb_input == "y"
		gb_order = true
	elsif gb_input == "n"
		gb_order = false
	else
		puts "I didn't understand you."
		puts "Please enter y or n."
	end
end
hi_enroll = nil
until hi_enroll != nil
	puts "Our company offers health insurance."
	puts "Would you like to enroll in our plan? (y/n)"
	hi_input = gets.chomp
	if hi_input == "y"
		hi_enroll = true
	elsif hi_input == "n"
		hi_enroll = false
	else
		puts "I didn't understand you."
		puts "Please enter y or n."
	end
end