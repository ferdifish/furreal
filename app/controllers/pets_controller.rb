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
    Pet.create(pet_params)
    redirect_to pets_path
  end

  def pet_params
    params.require(:pet).permit(:name, :price_per_day, :description, :species, :photo)
  end
end
