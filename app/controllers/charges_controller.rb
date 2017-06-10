class ChargesController < ApplicationController
  before_action :authenticate, except: [:stripe_activate]

  Stripe.api_key = "sk_test_kcPKsPn5ozwxBJySw5vPtZML"

  def create_charge
    temp_id = 'cus_112'
    binding.pry
    charge = Stripe::Charge.create(
      :amount => params[:charge][:amount],
      :currency => "cad",
      :customer => temp_id
      # :customer => params[:stripe_id]
    )
  end

  def stripe_activate
    user = User.find(params[:user][:id])
      customer = Stripe::Customer.create(
      :email => user.email,
      :source  => params[:token]
    )
    customer_id = customer.id
    if customer
      user.update!(:stripe_id => customer_id)
      render json: {customer: customer}
    end
  end
end
