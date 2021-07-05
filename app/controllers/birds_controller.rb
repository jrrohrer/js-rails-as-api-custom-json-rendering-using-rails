class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds
  end

  def show
    bird = Bird.find_by(id: params[:id])
    # to remove data from the hash of objects rendered:
    # render json: {id: bird.id, name: bird.name, species: bird.species } 
    # render json: bird.slice(:id, :name, :species)
    # render json: birds, only: [:id, :name, :species]
    # render json: birds, except: [:created_at, :updated_at]
    # render json: birds.to_json(except: [:created_at, :updated_at])

    # basic error messageing:
    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: 'Bird not found' }
    end
  end
end