# Spynamer method algorithm
# Method input - one parameter - string - realname
# Convert string to array, indices split by word
# reverse order of indices in this array
# convert this array back to a string, indices combined by " "
# convert this string back to an array, indices split by character
# use .map! to apply conditional statements to each index (character in string)
# if the downcase letter is u, change letter to a
# if the downcase letter is z, change letter to b
# if the letter is " ", it should remain the same
# if the downcase letter is a vowel (if the array containing each of the downcase vowels contains the letter), the next vowel should replace the letter (add one to index of array of vowels)
# else, downcase letter must be consonant, it should be replaced with next consonant (add one to index) of array of all consonants
# convert the array back to a string
# split the string into an array of words and capitalize each word
# convert this array back to a string, which is the output value of the method