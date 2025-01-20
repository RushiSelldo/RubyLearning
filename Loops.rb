# i=1
# while i <= 5
#   print i
#   i=i+1
# end


# counter = 1
# until counter > 10
#   puts counter
#   counter=counter+1
  
# end

# for num in 1..15
#   puts num
# end

# for num in 1...15
#   puts num
# end


# i = 20
# loop do
#   i -= 1
#   print "#{i}"
#   break if i <= 0
# end


# i = 20
# loop do
#   i = i - 1
#   next if i % 2 != 0  # Skip if i is odd
#   print i
#   break if i == 0  # Exit the loop when i reaches 0
# end


# array = [1,2,3,4,5]

# array.each do |x|
#   x += 10
#   print "#{x}"
# end


puts "First Word :"
text = gets.chomp

puts "Second Word :"
redact = gets.chomp

words = text.split(" ")

words.each do |x|
  if x == redact
    print "REDACTED "  # Print REDACTED when the word matches
  else
    print x + " "  # Print the word otherwise
  end
end
