class BookingsController < ApplicationController
  before_action :authenticate_user, except: [:car_bookings]

  #TODO:If the user has more than 100 bookings it will send out multiple arrays
  #data{array: {...}, array2{...}} This is sort of a bug and will cause the
  #apps to display incorrect information.

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      @notification = Notification.new(
        user_id: params[:booking][:renter_id],
        booking_id: @booking.id,
        sender: 'Boro Team',
        title: 'Booking Confirmation',
      )
      if @notification.save
        render json: {booking: @booking, notification: @notification}, status: :created, :root => false
      else
        render json: @notification.errors, status: :unprocessable_entity
      end
    else
      render json: @booking.errors, status: :unprocessable_entity
    end
  end

  # /bookings/car/[the id of the car]
  #TODO: rename
  def car_bookings
    @bookings = Booking.where(car_id: params[:id])
    render json: @bookings, :root => false
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
    params.require(:booking).permit(:start_date ,:end_date ,:car_id, :renter_id)
  end

end
