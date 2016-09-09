# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
# convert string from user to array of words
# iterate through that array to create a hash
# IF a key already exists in the hash equal to the index of the array
# => THEN add 1 to value of that key
# ELSE each index of the array is a new key in this hash, each value is 1
# output: hash - keys are item, values are quantities
def create_list(string)
	output = {}
	string.split.each do |i|
		if output.has_key?(i)
			output[i] += 1
		else
			output[i] = 1
		end
	end
	output
end

# Method to add an item to a list
# input: existing hash, string (new item - new key in hash), integer/quantity (new values)
# steps: 
# IF key already exists in hash with new_item
# => THEN print "This item already exists. Would you like to update its quantity? (y/n"
# => IF yes THEN run method update_quantity with same input values given to this method
# => IF no THEN do nothing
# add a new key to the hash (input string), with a value of the input integer

# output: hash with new value

def add_item(hash,new_item,quantity=1)
	if hash.has_key?(new_item)
		puts "This item already exists. Would you like to update its quantity? (y/n)"
		input = gets.chomp
		if input == "y"
			update_quantity(hash,new_item,quantity)
		end
	else
		hash[new_item] = quantity
	end
	hash
end

# Method to remove an item from the list
# input: existing hash, string (item to remove)
# steps: delete key of hash that is equal to the input string
# output: hash with item removed

def delete_item(hash,item)
	hash.delete(item)
	hash
end

# Method to update the quantity of an item
# input: existing hash, string - item to update, integer - new quantity
# steps:
# overwrite value for key of hash that is equal to input string with input integer
# output: updated hash

def update_quantity(hash,item,quantity)
	if hash.has_key?(item)
		hash[item] = quantity
	end
	hash
end

# Method to print a list and make it look pretty
# input: hash
# steps:
# iterate through the hash, printing "you need to buy (value) (key)"
# output: what was printed

def print_list(hash)
	hash.each do |item, quantity|
		puts "You need to buy #{quantity} #{item}."
	end
end

list = create_list("truffles truffles truffles")
puts list
list = add_item(list,"lemonade",2)
list = add_item(list,"tomatoes",3)
list = add_item(list,"onions",1)
list = add_item(list,"ice cream",4)
list = delete_item(list,"lemonade")
list = update_quantity(list,"ice cream",1)

puts list
print_list(list)

# Reflection:
# I've really started noticing the benefit of pseudocoding in this challenge
# It particularly helped me with writing the conditionals for the edge cases
# Whether to use a hash or an array depends what you want to accomplish 
# in this challenge, I created an array of words out of a string, and iterated
# through it to create a hash so that quantities could be accounted for.
# By default, methods return the value of the last line of the method, otherwise 
# they return what the return keyword instructs it to.
# strings, hashes, arrays, any sort of object - we can create a Kitten class and pass Kittens into methods!
# call the method within another method using your method variables
# Bison - thanks for helping me imagine some extra edge cases! That was really helpful!