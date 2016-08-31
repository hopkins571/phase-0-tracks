def hello(x,y)
	puts "Hello, I'm #{x} from #{y}."
	yield(1,2)
end

hello("Chuck","Chicago") {|a, b| puts a+b}
