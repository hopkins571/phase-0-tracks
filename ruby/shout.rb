# module Shout
# 	def self.yell_angrily(words)
# 		words + "!!!" + " :("
# 	end
# 	def self.yelling_happily(words)
# 		":D :D :D " + words + "!!!!! *gleefully prances*"
# 	end
# end

# # driver code
# puts Shout.yell_angrily("boo hiss")
# puts Shout.yelling_happily("free bikes for everyone")

module Shout
	def yell_angrily(words)
		words + "!!!" + " :("
	end
	def yelling_happily(words)
		":D :D :D " + words + "!!!!! *gleefully prances*"
	end
end

class Donald
	include Shout
end

class Toddler
	include Shout
end

toddler = Toddler.new
donald = Donald.new
puts toddler.yell_angrily("MINE!")
puts donald.yell_angrily("Goo goo gah gah")
puts toddler.yelling_happily("MOMMY!")
puts toddler.yelling_happily("I've got nothing for this one")