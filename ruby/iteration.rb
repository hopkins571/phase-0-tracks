def hello(x,y)
	puts "Hello, I'm #{x} from #{y}."
	yield(1,2)
end

hello("Chuck","Chicago") {|a, b| puts a+b}


array = ["blue", "yellow", "red", "orange", "purple", "black"]
hash = {
	"Nader" => 251,
	"Clinton" => 437,
	"Gore" => 257,
	"Kaine" => 537,
	"Trump" => 193
}

array.each do |color|
	puts "#{color} is a color. Cool.".capitalize
end

hash.each do |name, rbi|
	puts "#{name} is currently batting #{rbi}."
end

# Print array before modification
puts array

# Modify that array

array.map! do |color|
	color.insert(-1,"-ish")
end

# Print results
puts array

# Doing the last thing
# Number one - array

array.delete_if {|color| color == "red-ish"}

puts "after deleting one:"
puts array

# Number one - hash
puts "Before:"
puts hash
hash.delete_if {|name, rbi| rbi < 300}
puts "After:"
puts hash

# Number two - array
puts "Before:"
puts array
array.keep_if {|color| color == "black-ish"}
puts "after:"
puts array

hash["Trump"] = 245
hash["Warren"] = 245
# Number two - hash
puts "Before:"
puts hash
hash.keep_if {|name, rbi| rbi > 300}
puts "After:"
puts hash

# Number three - array
array << "blue-ish"
array << "green"
array << "tangerine"
puts "Before"
puts array
new_array = array.reject {|color| color == "blue-ish"}
puts "After"
puts new_array

# Number three - hash
hash["Trump"] = 245
hash["Warren"] = 245
puts "Before"
puts hash
new_hash = hash.select {|name, rbi| rbi > 300}
puts "After"
puts new_hash

# Number four - array
puts "Before"
puts array
new_array = array.drop_while {|color| color.include?("-ish")}
puts "After"
puts new_array

# Number four - hash
puts "Before"
puts hash
new_hash = hash.reject {|name, rbi| rbi < 300}
puts "After"
puts new_hash