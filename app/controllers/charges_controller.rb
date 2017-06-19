class ChargesController < ApplicationController
  before_action :authenticate, except: [:stripe_activate]

  def create_charge
    charge = Stripe::Charge.create(
      :amount => params[:charge],
      :currency => "cad",
      :customer => params[:stripeId]
    )
  end

  def stripe_activate
    user = User.find(params[:user][:id])
      customer = Stripe::Customer.create(
      :email => user.email,
      :source  => params[:token]
    )
    if customer
      user.update!(:stripe_id => customer.id)
      render json: {customer: customer}
    end
  end
end
