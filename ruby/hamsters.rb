puts "What is your hamster's name?"
name = gets.chomp
volume = -1
until volume > 0
	puts "On a scale from 1 to 10, how loud is your hamster?"
	volume = gets.chomp.to_i
	if volume == 0
		puts "I'm sorry. Please enter a number from 1 to 10."
	elsif volume > 10
		puts "I'm sorry. Please enter a number from 1 to 10."
	elsif volume < 0
		puts "I'm sorry. Please enter a number from 1 to 10."		
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
	elsif canadopt == "n"
		adoptable = false
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
		agestatement = "Its age is unknown"
	elsif agefloat < 0.0
		puts "I'm sorry. That is not a valid age."
		validanswer = false
	elsif agefloat > 0.0
		validanswer = true
		agestatement = "Its is about #{age} years old"
	elsif agefloat = 0.0
		puts "I'm sorry. That is not a valid age."
		validanswer = false
	end
end
if canadopt == "y"
	adoptstatement = "your hamster is a good candidate for adoption"
elsif canadopt == "n"
	adoptstatement = "your hamster is not a good candidate for adoption"
end
puts "So, if I've got things right, your hamster's name is #{name}. On a scale of 1 to 10, it has a volume level of #{volume}. Its fur color is #{color}. #{agestatement}, and #{adoptstatement}."

