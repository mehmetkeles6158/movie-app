class ActorsController < ApplicationController
  def index
    actors = Actor.all
    render json:{all_actors: actors}
    
  end

  def show

    actor = Actor.find_by(id:params[:id])
    render json:{actor: actor}
    
  end

  def create
    actor = Actor.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      known_for: params[:known_for]
    )

    if actor.save
      render json:{actor_created: actor}
    else
      render json: {errors: actor.errors.full_messages}
    end

  end

end
