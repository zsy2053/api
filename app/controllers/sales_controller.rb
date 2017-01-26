class SalesController < ApplicationController
  def user_sales
    @sales = Sale.where(leaser_id: params[:id])
    render json: {sales: @sales}
  end
end
