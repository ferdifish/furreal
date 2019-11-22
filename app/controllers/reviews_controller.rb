class ReviewsController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
    @pet = @booking.pet
  end

  def create
    @review = Review.new(review_params)
    @review.booking = Booking.find(params[:booking_id])
    @pet = @review.booking.pet
    if @review.save
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  # def destroy
  #   @review = Review.find(params[:id])
  #   @review.destroy
  # end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
