class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
    #render json: birds, except: [:created_at, :updated_at]
    #^^ render json: birds.to_json(except: [:created_at, :updated_at])  --> whats actually happening behind the scenes, only and except are rails parameter keywords 
  end
 
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: 'Bird not found' } #creates an error message because if a bird id is not found it returns a nil, and a nil is falsy is javascript so we can write an if/else statement here to print out our desired error messages 
    end
  end
end