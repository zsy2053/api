class SearchQueriesController < ApplicationController

  def car_search_homepage
    @cars = Car.where("make = ? OR model = ?", params[:make], params[:model])
    if @cars != []
      render json: @cars, :root => false
    else
      render json: { errors: "No cars were found!" }
    end
  end

  private

  def search_querie_params
    params.require(:search_params).permit(:make)
  end

end
