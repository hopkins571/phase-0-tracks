module Shout
	def self.yell_angrily(words)
		words + "!!!" + " :("
	end
	def self.yelling_happily(words)
		":D :D :D " + words + "!!!!! *gleefully prances*"
	end
end

# driver code
puts Shout.yell_angrily("boo hiss")
puts Shout.yelling_happily("free bikes for everyone")