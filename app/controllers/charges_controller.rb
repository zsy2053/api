class ChargesController < ApplicationController
  before_action :authenticate_user

  def new
  end

  def create
    # Amount in cents
    @amount = params[:param][:amount]
    @description = params[:param][:description]
    @email = params[:param][:user_email]
    @source = params[:param][:token][:id]
    @date = params[:param][:date]
    @cvc = params[:param][:cvc]
    @cardNumber = params[:param][:cardNumber]

    customer = Stripe::Customer.create(
      :email => @email,
      :source  => @source
    )

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
end
