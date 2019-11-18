class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @pet = Pet.new
  end

  def create
    pet = Pet.new(pet_params)
    pet.user = current_user
    pet.save
    redirect_to pets_path
  end

  def pet_params
    params.require(:pet).permit(:name, :price_per_day, :description, :species, :photo)
  end
end
