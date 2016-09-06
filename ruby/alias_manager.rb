# Spynamer method algorithm
# Method input - one parameter - string - realname
def spynamer(realname)
# Convert string to array, indices split by word
# reverse order of indices in this array
# convert this array back to a string, indices combined by " "
# convert this string back to an array, indices split by character
	reversearray = realname.split.reverse.join(" ").chars
# use .map! to apply conditional statements to each index (character in string)
	reversearray.map! do |letter|
# if the downcase letter is u, change letter to a
		if letter.downcase == "u"
			letter = "a"
# if the downcase letter is z, change letter to b
		elsif letter.downcase == "z"
			letter = "b"
# if the letter is " ", it should remain the same
		elsif letter == " "
			letter = " "
# if the downcase letter is a vowel (if the array containing each of the downcase vowels contains the letter), the next vowel should replace the letter (add one to index of array of vowels)
		elsif 'aeiou'.chars.include?(letter.downcase)
			letter = 'aeiou'.chars['aeiou'.index(letter.downcase)+1]
# else, downcase letter must be consonant, it should be replaced with next consonant (add one to index) of array of all consonants
		else
			letter = 'bcdfghjklmnpqrstvwxyz'.chars['bcdfghjklmnpqrstvwxyz'.index(letter.downcase)+1]
		end
	end
# convert the array back to a string
	spyname_array = reversearray.join.split
# split the string into an array of words and capitalize each word
	spyname_array.map! do |name|
		name.capitalize
	end
# convert this array back to a string, which is the output value of the method
	spyname = spyname_array.join(" ")
	spyname
end
loop do
	puts "Please enter a name:"
	puts "Enter quit to quit."
	name = gets.chomp
	break if name.downcase == "quit"
	puts spynamer(name)
end