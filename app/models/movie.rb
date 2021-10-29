class Movie < ApplicationRecord
  has_many :actors
  has_many :movie_genres
  has_many :genres, through: :movie_genres

  def genre_names
    # Make a model method called genre_names in movie.rb. It should deliver an array of just the names of the genres (strings) instead of genre hashes.
    genre = Genre.all
    genre_names = []

    genre.each do |g|
      genre_names << g[:name]
    end
  end

end
