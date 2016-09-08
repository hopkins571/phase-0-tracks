class Santa
	attr_reader :ethnicity, :reindeer_ranking
	attr_accessor :gender, :age
	def initialize(gender, ethnicity)
		puts "Initializing Santa instance ..."
		@gender = gender
		@ethnicity = ethnicity
		@reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
		@age = (0..140).to_a.sample
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
	def celebrate_birthday
		@age += 1
	end
	def get_mad_at(scapegoat)
		if @reindeer_ranking.include?(scapegoat)
			@reindeer_ranking.delete_if {|reindeer| reindeer == scapegoat}
			@reindeer_ranking.push(scapegoat)
		end
		@reindeer_ranking
	end
# gender setter method	
	# def gender=(new_gender)
	# 	@gender = new_gender
	# end
# age getter method	
	# def age
	# 	@age
	# end
# ethnicity getter method
	# def ethnicity
	# 	@ethnicity
	# end
	def random_age
		@age = (1..100).to_a.sample
	end
end
example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]
reindeers = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
santaplex = []
200.times do |i|
	santaplex << Santa.new(example_genders.sample,example_ethnicities.sample)
end
# puts santaplex


santaplex.each do |i|
	i.get_mad_at(reindeers.sample)
	puts "Santa is #{i.gender}, #{i.ethnicity}, and #{i.age} years old."
	puts "Santa is mad at #{i.reindeer_ranking[-1]}."
end



# example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
# example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]
# billybob = Santa.new(example_genders.sample,example_ethnicities.sample)
# puts billybob.print_demos
# billybob.celebrate_birthday
# puts billybob.print_demos
# puts billybob.age
# billybob.gender = "genderqueer"
# puts billybob.print_demos
# puts billybob.least_fave_reindeer
# billybob.get_mad_at("Vixen")
# puts billybob.least_fave_reindeer
# billybob.random_age
# puts billybob.age
# puts billybob.ethnicity

# groovy_santas = []
# 5.times do |i|
# 	groovy_santas << Santa.new(example_genders.sample,example_ethnicities.sample)



# st_nick = Santa.new
# st_nick.speak
# st_nick.eat_milk_and_cookies("generic Oreo")

# santas = []
# santas << Santa.new("agender", "black")
# santas << Santa.new("female", "Latino")
# santas << Santa.new("bigender", "white")
# santas << Santa.new("male", "Japanese")
# santas << Santa.new("female", "prefer not to say")
# santas << Santa.new("gender fluid", "Mystical Creature (unicorn)")
# santas << Santa.new("N/A", "N/A")
# puts santas

# santas = []
# example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
# example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]
# example_genders.length.times do |i|
# santas << Santa.new(example_genders[i], example_ethnicities[i])
# end
# santas.each do |i|
# i.print_demos
# end
# santas.each do |i|
# i.add1_to_age
# end
# santas.each do |i|
# i.print_demos
# end

# random1 = Santa.new(example_genders.sample,example_ethnicities.sample)
# random1.print_demos
# random1.add1_to_age
# random1.print_demos
# random2 = Santa.new(example_genders.sample,example_ethnicities.sample)
# random2.print_demos

# santas = []
# 12.times do |i|
# santas << Santa.new(example_genders.sample,example_ethnicities.sample)
# end
# santas.each do |i|
# i.print_demos
# end
# santas.each do |i|
# i.age_randomizer
# end
# puts "ages are now random:"
# santas.each do |i|
# i.print_demos
# end


