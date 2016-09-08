# class Puppy
# 	def initialize
# 		puts "Initialize new puppy instance..."
# 	end
# 	def fetch(toy)
# 		puts "I brought back the #{toy}!"
#     	toy
#   	end
# 	def speak(i)
# 		i.times {puts "Woof!"}
# 	end
# 	def roll_over
# 		puts "*rolls over*"
# 	end
# 	def dog_years(i)
# 		i * 7
# 	end
# 	def play_dead
# 		puts "Puppy is dead. :("
# 		puts "Just kidding! ;)"
# 	end
# end

# driver code
# fido = Puppy.new
# fido.fetch("ball")
# fido.speak(4)
# fido.roll_over
# puts fido.dog_years(4)
# fido.play_dead

class Kitten
	def initialize
		puts "Meow meow! Annyong!"
	end
	def hunt_bugs(hour)
		puts "Kitty was hunting for #{hour} hours and caught #{hour*10} bugs!"
	end
	def litterbox(is_clean)
		if is_clean
			puts "Kitty used the litter box!"
		else
			puts "Kitty pooped outside the box!"
		end
	end
end

mr_meows = Kitten.new
mr_meows.litterbox(true)
mr_meows.hunt_bugs(4)
mr_meows.litterbox(false)



