# class - mindreader game
#
# initialize method
# input: string - word to guess from player 1
# output: none
# create variables 
# guesses allowed = (length of input * 1.5) to integer
# guesses = blank array
# guess count = 0
# keyword = input string downcase into array of characters
# game is over = false
# won game = false
# display word = blank array
# procedure:
# length of input string times add "-" to array display word
#
# guess method
# input - string guessed char
# output - boolean success
# procedure:
# make guessed char downcase
# set success to false
# IF the array guesses does not include guessed char
# => THEN:
# 	IF keyword contains guessed char,
# 	=> THEN UNTIL keyword doesn't contain guessed char
# 			replace index of display word (eq to index of keyword at guessed char) to guessed char
#			replace index of keyword at guessed char to "-"
#			set success true
#		ELSE add 1 to guess count
# => add guessed char to guesses array
# determine if game over / won / lost
# IF display word doesn't include "-" AND guess count < guesses allowed
# => THEN won is true, game over is true
# ELSIF guess count equals guesses allowed
# => THEN won is false, game over is true

class MindReader
	attr_reader :guess_count
	attr_reader :is_over
	attr_reader :guesses_allowed
	attr_reader :display_word
	attr_reader :won
	attr_reader :keyword

	def initialize(word_to_guess)
		@keyword = word_to_guess.downcase.chars
		@guesses_allowed = (1.5 * word_to_guess.length).to_i
		@guesses = []
		@guess_count = 0
		@won = false
		@is_over = false
		@display_word = []
		word_to_guess.length.times { @display_word << "-" }
	end

	def guess(guessed_char)
		success = false
		guessed_char.downcase!	
		if !@guesses.include?(guessed_char)
			if @keyword.include?(guessed_char)
				until !@keyword.include?(guessed_char)
					@display_word[@keyword.index(guessed_char)] = guessed_char
					@keyword[@keyword.index(guessed_char)] = "-"
					success = true
				end
			else
				@guess_count += 1
			end
			@guesses << guessed_char
			if !@display_word.include?("-") && @guess_count < @guesses_allowed
				@won = true
				@is_over = true
			elsif @guess_count == @guesses_allowed
				@is_over = true
			end
		end
		success
	end
end

