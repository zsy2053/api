class SalesController < ApplicationController
  before_action :authenticate_user
  
  def user_sales
    @sales = Sale.where(leaser_id: params[:id])
    render json: {sales: @sales}, :root => false
  end
end
