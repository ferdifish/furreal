class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
    @reviews = @pet.reviews
  end

  def new
    @pet = Pet.new
  end

  def create
    pet = Pet.new(pet_params)
    pet.user = current_user
    if pet.save
      redirect_to pets_path
    else
      render :new
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    redirect_to pets_path
  end

  def pet_params
    params.require(:pet).permit(:name, :price_per_day, :description, :species, :photo)
  end
end
