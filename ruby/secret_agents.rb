# Encrypt Method Pseudocode
# 
# Define a method that takes a string of text and advances each character of the string index by index one letter forward.
# Create a parameter that is a string of text with parameter name 'x'
# Define variable 'output' as a new string and a new variable 'index' equal to 0.
# Build a loop until index equals length of the string.
# Add to the variable output the next value of the index of 'x.'
# Add 1 to index.
# End the loop.
# Print variable output.
#
# Decrypt Method Pseudocode
#
# Define a method that takes a string of text and reverses each character by one letter in the alphabet.
# Define 'alphabet' variable that is a string of all letters in the alphabet.
# Define variable 'output' as a new string and a new variable 'index' equal to 0.
# Build a loop until index equals length of the string.
# Add to the variable output the following:
# The value of the following index of the variable alphabet
# 1 less than the index of alphabet at the following character within the string 'alphabet.'
# The index of 'y' at the variable index.
# Add 1 to index.
# End the loop.
# Print variable output.
def encrypt(x)
  output = ""
  index = 0
  until index == x.length
  	if x[index] == "z"
      output += "a"
      index += 1
  	else
  	  output += x[index].next!
  	  index += 1
    end
  end
  p output
end
def decrypt(y)
	alphabet = "abcdefghijklmnopqrstuvwxyz"
	output = ""
	index = 0
	until index == y.length
		if y[index] == "a"
		  output += "z"
		  index += 1
	    else
		  output += alphabet[alphabet.index(y[index])-1]
		  index += 1
	    end
	end
	p output
end
encrypt("abc") 
encrypt("zed") 
decrypt("bcd") 
decrypt("afe")