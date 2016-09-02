# Define method - input integer and array
# iterate through each index of array

def search(integer,array)
	index = 0
	# using while loop while index < array.length
	# compare value of integer to array at current index
	while index < array.length
		output = nil
		array.each do |number|
			# if equal to one another, return output of index
			if array[index] == integer
				output = index
			# Else return output
			else
				output = nil
				output
			end
		end
	# Must break loop if output not equal to nil so index of hit doesn't get overwritten
	if output != nil
		break
	end
	index += 1
	end
	output
end

int = 101
arr = [1,2,3,4,5,10,100,765]
puts search(int,arr)