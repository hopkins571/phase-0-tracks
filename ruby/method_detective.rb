# Replace in the "<???>" with the appropriate method (and arguments, if any).
# Uncomment the calls to catch these methods red-handed.

# When there's more than one suspect who could have
# committed the crime, add additional calls to prove it.

puts "iNvEsTiGaTiOn".swapcase
# => “InVeStIgAtIoN”

# "zom".<???>
puts "zom".insert(2,'o')
puts "zom".gsub('o','oo')
# => “zoom”

puts "enhance".center(16, ' ')
# => "    enhance    "

puts "Stop! You’re under arrest!".upcase
# => "STOP! YOU’RE UNDER ARREST!"

# "the usual".<???>
puts "the usual".insert(9, " suspects")
#=> "the usual suspects"


# " suspects".<???>
puts " suspects".insert(0, "the usual")
puts " suspects".prepend("the usual")
# => "the usual suspects"


puts "The case of the disappearing last letter".chop
puts "The case of the disappearing last letter".slice(0..38)
# => "The case of the disappearing last lette"

puts "The mystery of the missing first letter".slice(1..38)
# => "he mystery of the missing first letter"

puts "Elementary,    my   dear        Watson!".squeeze(" ")
# => "Elementary, my dear Watson!"

puts "z".ord
# => 122 
# (What is the significance of the number 122 in relation to the character z?)
# Answer: It is the integer ordinal of the character 'z'

puts "How many times does the letter 'a' appear in this string?".count('a')