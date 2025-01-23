class MovieLibrary
  def initialize
    @movies = {
      StarWars: 4.8,
      Divergent: 4.7
    }
  end

  def add_movie
    puts "What movie would you like to add?"
    title = gets.chomp.strip
    if title.empty?
      puts "Movie title cannot be empty."
      return
    end

    title_sym = title.to_sym
    if @movies[title_sym].nil?
      puts "What rating does the movie have? (0.0 to 5.0)"
      rating = gets.chomp.strip
      if valid_rating?(rating)
        @movies[title_sym] = rating.to_f
        puts "Movie '#{title}' with rating #{rating} added successfully!"
      else
        puts "Invalid rating. Please enter a number between 0.0 and 5.0."
      end
    else
      puts "That movie already exists! Its rating is #{@movies[title_sym]}."
    end
  end

  def update_movie
    puts "What movie would you like to update?"
    title = gets.chomp.strip
    if title.empty?
      puts "Movie title cannot be empty."
      return
    end

    title_sym = title.to_sym
    if @movies[title_sym].nil?
      puts "Movie not found! You can add it instead."
    else
      puts "Enter the new rating for '#{title}' (0.0 to 5.0):"
      rating = gets.chomp.strip
      if valid_rating?(rating)
        @movies[title_sym] = rating.to_f
        puts "Movie '#{title}' updated to rating #{rating}."
      else
        puts "Invalid rating. Please enter a number between 0.0 and 5.0."
      end
    end
  end

  def display_movies
    if @movies.empty?
      puts "No movies available."
    else
      puts "Here are the movies in your library:"
      @movies.each { |movie, rating| puts "#{movie}: #{rating}" }
    end
  end

  def delete_movie
    puts "What movie would you like to delete?"
    title = gets.chomp.strip
    if title.empty?
      puts "Movie title cannot be empty."
      return
    end

    title_sym = title.to_sym
    if @movies[title_sym].nil?
      puts "Movie not found!"
    else
      @movies.delete(title_sym)
      puts "Movie '#{title}' deleted successfully!"
    end
  end

  def search_movie
    puts "Enter the name of the movie you want to search for:"
    title = gets.chomp.strip
    if title.empty?
      puts "Movie title cannot be empty."
      return
    end

    title_sym = title.to_sym
    if @movies.key?(title_sym)
      puts "#{title}: #{@movies[title_sym]}"
    else
      puts "Movie not found!"
    end
  end

  def highest_rated_movie
    if @movies.empty?
      puts "No movies available to display the highest rated."
    else
      highest = @movies.max_by { |_, rating| rating }
      puts "The highest rated movie is '#{highest[0]}' with a rating of #{highest[1]}."
    end
  end

  def average_rating
    if @movies.empty?
      puts "No movies available to calculate the average rating."
    else
      average = @movies.values.sum / @movies.size
      puts "The average rating of all movies is #{average.round(2)}."
    end
  end

  def recommend_movie
    if @movies.empty?
      puts "No movies available to recommend."
    else
      recommended = @movies.keys.sample
      puts "We recommend you watch '#{recommended}'."
    end
  end

  def valid_rating?(rating)
    Float(rating) rescue false and (0.0..5.0).include?(rating.to_f)
  end

  def menu
    loop do
      puts "\nWhat would you like to do? (Type 'exit' to quit)"
      puts "1. Add a movie"
      puts "2. Update a movie"
      puts "3. Display all movies"
      puts "4. Delete a movie"
      puts "5. Search for a movie"
      puts "6. Display the highest rated movie"
      puts "7. Display the average rating of all movies"
      puts "8. Recommend a random movie"

      choice = gets.chomp.downcase

      case choice
      when '1', 'add'
        add_movie
      when '2', 'update'
        update_movie
      when '3', 'display'
        display_movies
      when '4', 'delete'
        delete_movie
      when '5', 'search'
        search_movie
      when '6', 'highest'
        highest_rated_movie
      when '7', 'average'
        average_rating
      when '8', 'recommend'
        recommend_movie
      when 'exit'
        puts "Goodbye!"
        break
      else
        puts "Invalid option. Please try again."
      end
    end
  end
end


# Main Program
library = MovieLibrary.new
library.menu
