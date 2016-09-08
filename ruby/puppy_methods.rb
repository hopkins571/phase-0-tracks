class Puppy
	def fetch(toy)
		puts "I brought back the #{toy}!"
    	toy
  	end
	def speak(i)
		i.times {puts "Woof!"}
	end
	def roll_over
		puts "*rolls over*"
	end
	def dog_years(i)
		i * 7
	end
	def play_dead
		puts "Puppy is dead. :("
		puts "Just kidding! ;)"
	end
end

# driver code
fido = Puppy.new
fido.fetch("ball")
fido.speak(4)
fido.roll_over
puts fido.dog_years(4)
fido.play_dead
