class ActorsController < ApplicationController
  def firstactor

    first = Actor.first

    fname = first.first_name
    lname = first.last_name

    render json:{first_actor: first}

    # render json:{message:"#{fname} #{lname} is my favorite actor!"}
    
  end
end
