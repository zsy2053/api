class ChargesController < ApplicationController
  before_action :authenticate_user
  
  def new
  end

  def create
    binding.pry
    # Amount in cents
    @amount = params[:param][:amount]
    @description = params[:param][:description]
    @email = params[:param][:user_email]
    @source = params[:param][:token][:id]

    customer = Stripe::Customer.create(
      :email => @email,
      :source  => @source
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => @description,
      :currency    => 'cad'
    )

  rescue Stripe::CardError => e
    render json: {errors: e.message}
  end
end
