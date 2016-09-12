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
	attr_reader :is_phrase
	attr_reader :guesses

	def initialize(word_to_guess)
		@keyword = word_to_guess.downcase.chars
		if word_to_guess.split.length > 1
			@is_phrase = true
		else
			@is_phrase = false
		end
		if @is_phrase
			@guesses_allowed = word_to_guess.split.length * 3
		else
			@guesses_allowed = word_to_guess.length
		end
		@guesses = []
		@guess_count = 0
		@won = false
		@is_over = false
		@display_word = []
		word_to_guess.chars.each do |char|
			if char == " "
				@display_word << char
				@guesses << char
			elsif char == "'"
				@display_word << char
				@guesses << char
			elsif char == "-"
				@display_word << char
				@guesses << char
			elsif char == "."
				@display_word << char
				@guesses << char
			elsif char == "!"
				@display_word << char
				@guesses << char
			elsif char == ","
				@display_word << char
				@guesses << char
			elsif char == "?"
				@display_word << char
				@guesses << char
			elsif char == "&"
				@display_word << char
				@guesses << char
			else
				@display_word << "_"
			end
		end
	end

	def guess(guessed_char)
		success = false
		guessed_char.downcase!	
		if !@guesses.include?(guessed_char)
			if @keyword.include?(guessed_char)
				until !@keyword.include?(guessed_char)
					@display_word[@keyword.index(guessed_char)] = guessed_char
					@keyword[@keyword.index(guessed_char)] = "_"
				end
				success = true
			else
				@guess_count += 1
			end
			@guesses << guessed_char
			if !@display_word.include?("_") && @guess_count < @guesses_allowed
				@won = true
				@is_over = true
			elsif @guess_count == @guesses_allowed
				@is_over = true
			end
		end
		success
	end
end

# UI
# Prompt user 1 for word to guess
# IF input includes "-"
# => THEN print invalid input
# => UNTIL user provides input without "-", prompt for input
# create new MindReader game with input parameter of guess word
# clear screen
# prompt user 2 to press return when ready
# WHILE game is not over
# => print "guess this word"
# => print display word to string joined by spaces
# => print "enter character to guess"
# 	get input
# => IF input length > 1 or if input equals "-", invalid input - loop until valid input given
# new variable guess succeeded - result of running guess method with user input
# IF guess succeeded is true
# 	THEN display encouraging message
# ELSE display discouraging message
# check for game over / game won
# IF game over & game won
# display congratulatory message
# ELSIF game over & not won
# display taunting message

puts "Welcome to MindReader."
puts "User 1, please enter a word or phrase for user 2 to guess:"
guess_word = gets.chomp
validinput = false
if guess_word.chars.include?("_") || guess_word.length < 3
	until validinput == true
		puts "Your input cannot include '_' and must be at least 3 characters."
		puts "Please try again."
		guess_word = gets.chomp
		if !guess_word.chars.include?("_") && guess_word.length >= 3
			validinput = true
		end
	end
end
game = MindReader.new(guess_word)
system "clear"
puts "User 2, please enter return to continue."
blank = gets.chomp
while !game.is_over
	if game.is_phrase
		puts "Guess this phrase: #{game.display_word.join(" ")}"
	else
		puts "Guess this word: #{game.display_word.join(" ")}"
	end
	puts "Enter a character to guess."
	if game.guesses_allowed - game.guess_count == 1
		puts "You have one guess remaining."
	else
		puts "You have #{game.guesses_allowed - game.guess_count} guesses remaining."
	end
	validinput = false
	until validinput == true
		user_guess = gets.chomp
		if user_guess.length != 1 || user_guess == "_"
			puts "Invalid input."
			puts "Please enter only one character, excluding '_'."
		else
			validinput = true
		end
	end
	guess_succeeded = game.guess(user_guess)
	if guess_succeeded
		puts "Right on! You got it, champ!"
	else
		puts "Sorry, no luck! :("
	end
	if game.is_over && game.won
		puts "Awesome, you won! #{game.display_word.join(" ")}"
	elsif game.is_over && !game.won
		puts "You lost! Booo! :-P"
	end
end
