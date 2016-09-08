class Santa
	def initialize(gender, ethnicity)
		puts "Initializing Santa instance ..."
		@gender = gender
		@ethnicity = ethnicity
		@reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
		@age = 0
	end
	def speak
		puts "Ho, ho, ho! Haaaappy holidays!"
	end
	def eat_milk_and_cookies(cookie_type)
		puts "That was a good #{cookie_type}!"
	end
	def print_demos
		puts "Age is #{@age}, ethnicity is #{@ethnicity}, gender is #{@gender}."
	end
	def add1_to_age
		@age += 1
	end
	def age_randomizer
		@age = (1..100).to_a.sample
	end
end

# st_nick = Santa.new
# st_nick.speak
# st_nick.eat_milk_and_cookies("generic Oreo")

santas = []
santas << Santa.new("agender", "black")
santas << Santa.new("female", "Latino")
santas << Santa.new("bigender", "white")
santas << Santa.new("male", "Japanese")
santas << Santa.new("female", "prefer not to say")
santas << Santa.new("gender fluid", "Mystical Creature (unicorn)")
santas << Santa.new("N/A", "N/A")
puts santas

santas = []
example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]
example_genders.length.times do |i|
  santas << Santa.new(example_genders[i], example_ethnicities[i])
end
santas.each do |i|
	i.print_demos
end
santas.each do |i|
	i.add1_to_age
end
santas.each do |i|
	i.print_demos
end

random1 = Santa.new(example_genders.sample,example_ethnicities.sample)
random1.print_demos
random1.add1_to_age
random1.print_demos
random2 = Santa.new(example_genders.sample,example_ethnicities.sample)
random2.print_demos

santas = []
12.times do |i|
	santas << Santa.new(example_genders.sample,example_ethnicities.sample)
end
santas.each do |i|
	i.print_demos
end
santas.each do |i|
	i.age_randomizer
end
puts "ages are now random:"
santas.each do |i|
	i.print_demos
end


