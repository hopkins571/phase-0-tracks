# Loop until HR director enters valid response
total_emp = 0
until total_emp > 0
	puts "Hello, HR Director!"
	puts "How many employees need to be processed now?"
	total_emp = gets.chomp.to_i
	if total_emp <= 0
		puts "I'm sorry. That response was invalid."
	end
end
emp_num = 0
# Loop until all employees are processed
until emp_num == total_emp
	puts "Welcome, new employee!"
	puts "What is your name?"
	name = gets.chomp
	puts "What is your age in years?"
	age = gets.chomp.to_i
	puts "In what year were you born?"
	birthyear = gets.chomp.to_i
	# Loop for garlic bread order
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
	# Loop for insurance enrollment
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
	# Allergy loop - so does this mean redheads are vampires?
	allergies_done = false
	puts "Please name all your allergies."
	puts "Please enter one allergy per line."
	puts "When you are finished, enter done."
	until allergies_done == true
		allergy = gets.chomp
		if allergy == "sunshine"
			allergies_done = true
		elsif (allergy == "done") || (allergy == "done.") || (allergy == "Done") || (allergy == "Done.")
			allergies_done = true
		end
	end
	# Setting boolean variable if age is correct
	currentyear = Time.new.year
	rightage = false
	if (currentyear - age == birthyear) || (currentyear - age == birthyear + 1)
		rightage = true
	end
	# Must set result variable to inconclusive by default
	result = "Results inconclusive."
	# First condition
	if rightage && (gb_order || hi_enroll)
		result = "Probably not a vampire."
	end
	# Second condition
	if !rightage && (!gb_order || !hi_enroll)
		result = "Probably a vampire."
	end
	# Third condition
	if !rightage && !gb_order && !hi_enroll
		result = "Almost certainly a vampire."
	end
	# Fourth condition
	if (name == "Drake Cula") || (name == "Tu Fang") || (allergy == "sunshine")
		result = "Definitely a vampire."
	end
	# Print result
	puts "#{name}: #{result}"
	emp_num += 1
end