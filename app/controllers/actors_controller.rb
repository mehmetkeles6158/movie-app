class ActorsController < ApplicationController
  # before_action :authenticate_admin, except: [:index, :show]
  def index
    actors = Actor.all
    render json:actors
    
  end

  def show

    actor = Actor.find_by(id:params[:id])
    render json:actor
    
  end

  def create
    actor = Actor.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      known_for: params[:known_for],
      movie_id: params[:movie_id]
    )

    if actor.save
      render json:actor
    else
      render json: {errors: actor.errors.full_messages}, status: 422
    end

  end

  def update

    actor = Actor.find_by(id: params[:id])
    actor.first_name = params[:first_name] || actor.first_name
    actor.last_name = params[:last_name] || actor.last_name
    actor.known_for = params[:known_for] || actor.known_for
    actor.movie_id = params[:movie_id] || actor.movie_id 

    if actor.save
      render json: actor
    else
      render json: {errors: actor.errors.full_messages}
    end

  end

  def destroy
    
    actor = Actor.find_by(id: params[:id])
    actor.destroy
    render json: actor
  end


end
