class BookingsController < ApplicationController
  before_action :authenticate_user

  #TODO:If the user has more than 100 bookings it will send out multiple arrays
  #data{array: {...}, array2{...}} This is sort of a bug and will cause the
  #apps to display incorrect information.
  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      params[:booking][:image].each do |file|
        @booking.booking_photos.create!(:document => file)
      end
      render json: @booking, status: :created, location: @booking
    else
      render json: @booking.errors, status: :unprocessable_entity
    end
    end


  def leaser_bookings
    @bookings = Booking.where(leaser_id: params[:id])
    render json: {leaser_bookings: @bookings}, :root => false
  end

  def renter_bookings
    @bookings = Booking.where(renter_id: params[:id])
    render json: {renter_bookings: @bookings}, :root => false
  end

  private

  # Only allow a trusted parameter "white list" through.
  def booking_params
    params.require(:booking).permit(:start_date ,:end_date ,:car_id ,:created_at ,:updated_at ,:renter_id ,:leaser_id)
  end

end
