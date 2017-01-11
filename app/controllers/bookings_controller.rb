class BookingsController < ApplicationController


  #TODO:If the user has more than 100 bookings it will send out multiple arrays
  #data{array: {...}, array2{...}} This is sort of a bug and will cause the
  #apps to display incorrect information.

  def leaser_bookings
    @bookings = Booking.where(leaser_id: params[:id])
    render json: {leaser_bookings: @bookings}
  end

  def renter_bookings
    @bookings = Booking.where(renter_id: params[:id])
    render json: {renter_bookings: @bookings}
  end

end
