class ChargesController < ApplicationController
  before_action :authenticate

  def create
    # Create a Stripe user
    binding.pry
    @amount = params[:param][:amount]
    @description = params[:param][:description]
    @email = params[:param][:user_email]
    @token = params[:param][:token][:id]
    @date = params[:param][:date]
    @cvc = params[:param][:cvc]
    @cardNumber = params[:param][:cardNumber]

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => @description,
      :currency    => 'cad',
      :cvc         => @cvc,
      :date        => @date,
      :cardNumber  => @cardNumber
    )

  rescue Stripe::CardError => e
    render json: {errors: e.message}
  end

  def stripe_activate
    @user = User.find(params[:id])
    binding.pry
    customer = Stripe::Customer.create(
      :email => params[@User.email],
      :source  => @token
    )
    binding.pry
  end
end
