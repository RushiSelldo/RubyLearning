movies = {
  StarWars: 4.8, 
  Divergent: 4.7
  }

puts "What would you like to do? "

choice = gets.chomp

case choice
when "add"
  puts "What movie would you like to add? "
  title = gets.chomp
  if movies[title.to_sym].nil? 
    puts "What rating does the movie have? "
    rating = gets.chomp
    movies[title.to_sym] = rating.to_i
  else
    puts "That movie already exists! Its rating is #{movies[title.to_sym]}."
  end
when "update"
 puts "What movie would you like to update? "
  title = gets.chomp
  if movies[title.to_sym].nil?
    puts "What movie would you like to add? "
    title = gets.chomp
    puts "What rating does the movie have? "
    rating = gets.chomp
    movies[title.to_sym] = rating.to_i
  else
     puts "Enter the rating to be updated : "
    rating=gets.chomp
    movies[title]=rating
  end
when "display"
movies.each { |movie,rating|
puts "#{movie}: #{rating}"
}
when "delete"
puts "What movie would you like to delete? "
    title = gets.chomp

    if movies[title.to_sym].nil?
      puts "Movie doesnt exist!"
    else
      movies.delete(title.to_sym)
    end
else
  puts "Error!"
end