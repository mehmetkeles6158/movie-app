# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# actor = Actor.new({first_name: "Benedict", last_name: "Cumberbatch", known_for: "Sherlock"})
# actor.save

# 10.times do
#   actor = Actor.new(first_name:Faker::Name.first_name, last_name:Faker::Name.last_name, known_for:Faker::Superhero.descriptor)
#   actor.save
# end

def genre_names
  # Make a model method called genre_names in movie.rb. It should deliver an array of just the names of the genres (strings) instead of genre hashes.
  genre = Genre.all
  genre_names = []

  genre.each do |g|
    genre_names << g[:name]
  end
  p genre_names
end
