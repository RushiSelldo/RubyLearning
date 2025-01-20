print "First Name :- "
first_name = gets.chomp
first_name.capitalize!  # Capitalize the first name

print "Last Name :- "
last_name = gets.chomp
last_name.capitalize!  # Capitalize the last name

print "City Name :- "
city = gets.chomp
city.capitalize!  # Capitalize the city name

print "State Abbreviation :- "
state = gets.chomp
state.upcase!

puts "Your name is #{first_name} and surname is #{last_name} you live in #{city} of #{state}"
