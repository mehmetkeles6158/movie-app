class ActorsController < ApplicationController
  def firstactor

    first = Actor.first

    fname = first.first_name
    lname = first.last_name

    render json:{first_actor: first}

    # render json:{message:"#{fname} #{lname} is my favorite actor!"}
    
  end

  def all_actors
    # this code is in seed.rb
    # 10.times do
    #   actor = Actor.new(first_name:Faker::Name.first_name, last_name:Faker::Name.last_name, known_for:Faker::Superhero.descriptor)
    #   actor.save
    # end

    actors = Actor.all

    render json:actors.as_json
  end


end
