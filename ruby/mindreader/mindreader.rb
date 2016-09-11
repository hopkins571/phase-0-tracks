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


