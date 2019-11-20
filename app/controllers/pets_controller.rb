class PetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @pets = Pet.all
    @marked_pets = Pet.where.not(latitude: nil, longitude: nil)

    @markers = @pets.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { pet: pet })
      }
    end
  end

  def my_pets
    @pets = current_user.pets
  end

  def show
    @pet = Pet.find(params[:id])
    @reviews = @pet.reviews
    @booking = Booking.new
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.location = current_user.location
    @pet.latitude = current_user.latitude
    @pet.longitude = current_user.longitude
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
