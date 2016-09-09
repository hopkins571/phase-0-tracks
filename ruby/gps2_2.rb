# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
# convert string from user to array of words
# iterate through that array to create a hash
# each index of the array is a new key in this hash, each value is 1
# output: hash - keys are item, values are quantities
def create_list(string)
	word_array = string.split
	output = {}
	word_array.each do |i|
		output[i] = 1
	end
	output
end

# Method to add an item to a list
# input: existing hash, string (new item - new key in hash), integer/quantity (new values)
# steps: 
# add a new key to the hash (input string), with a value of the input integer
# output: hash with new value

def add_item(hash,new_item,quantity)
	hash[new_item] = quantity
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
	hash[item] = quantity
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

list = create_list("")
puts list
list = add_item(list,"lemonade",2)
list = add_item(list,"tomatoes",3)
list = add_item(list,"onions",1)
list = add_item(list,"ice cream",4)
list = delete_item(list,"lemonade")
list = update_quantity(list,"ice cream",1)

puts list
print_list(list)
