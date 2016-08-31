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
