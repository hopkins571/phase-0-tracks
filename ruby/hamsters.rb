puts "What is your hamster's name?"
name = gets.chomp
volume = -1
until volume > 0
	puts "On a scale from 1 to 10, how loud is your hamster?"
	volume = gets.chomp.to_i
	if volume <= 0
		puts "I'm sorry. Please enter a number from 1 to 10."
	elsif volume > 10
		puts "I'm sorry. Please enter a number from 1 to 10."
		volume = -1		
	end
end
puts "What is your hamster's fur color?"
color = gets.chomp
adoptable = nil
until adoptable != nil
	puts "Is your hamster a good candidate for adoption? (y/n)"
	canadopt = gets.chomp
	if canadopt == "y"
		adoptable = true
		adoptstatement = "it is a good candidate for adoption"
	elsif canadopt == "n"
		adoptable = false
		adoptstatement = "it is not a good candidate for adoption"
	else
		puts "I didn't understand you. Try again."
	end
end
validanswer = false
until validanswer == true
	puts "What is your hamster's estimated age? If you are unsure, please enter n/a."
	age = gets.chomp
	agefloat = age.to_f
	if age == "n/a"
		age = nil
		validanswer = true
		agestatement = "Your hamster's age is unknown"
	elsif agefloat <= 0.0
		puts "I'm sorry. That is not a valid age."
	elsif agefloat > 0.0
		validanswer = true
		agestatement = "Your hamster is about #{age} years old"
	end
end
puts "So, if I've got things right:"
puts "Your hamster's name is #{name}."
puts "On a scale from 1 to 10, it has a volume level of #{volume}."
puts "It has #{color} fur."
puts "#{agestatement}, and #{adoptstatement}."

