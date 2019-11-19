class PetsController < ApplicationController
  def index
    # if current_user
    #   @pets = Pet.where.not(user: current_user)
    # else
      @pets = Pet.all
    # end
  end

  def my_pets
    @pets = current_user.pets
  end

  def show
    @pet = Pet.find(params[:id])
    @reviews = @pet.reviews
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
    if @pet.save
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
    params.require(:pet).permit(:name, :price_per_day, :description, :species, photos: [])
  end
end
