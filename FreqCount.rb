# puts "Type something here..."
# text = gets.chomp

# # Split the text into words
# words = text.split

# # Initialize the frequencies hash with a default value of 0
# frequencies = Hash.new(0)

# # Iterate over the words array
# words.each do |word|
#   frequencies[word] += 1 # Increment the frequency of each word
# end

# # Output the frequencies
# puts frequencies


#Sort by frq

puts "Type something here..."
text = gets.chomp

# Split the text into words
words = text.split

# Initialize the frequencies hash with a default value of 0
frequencies = Hash.new(0)

# Iterate over the words array
words.each do |word|
  frequencies[word] += 1 # Increment the frequency of each word
end

# Output the frequencies

frequencies=frequencies.sort_by do |name,count|
  count
end
   
frequencies.reverse!
frequencies.each { |name,count|
  puts "#{name} #{count}"
}


