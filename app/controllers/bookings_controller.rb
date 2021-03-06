class BookingsController < ApplicationController
  def index
    @bookings = Booking.where("end_date < ?", Time.now)
    @upcoming_bookings = Booking.where("end_date > ?", Time.now)
    @user = current_user
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @pet = Pet.find(params[:pet_id])
    # @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.pet = Pet.find(params[:pet_id])
    if @booking.save
      redirect_to bookings_path
    else
      redirect_to pet_path(@booking.pet)
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
