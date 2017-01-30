class SearchQueriesController < ApplicationController
  #skip_before_action :authenticate_user, only: [:car_search_homepage]

    def car_search_homepage
      @cars = Car.where("make = ? OR model = ?", search_querie_params[:make], search_querie_params[:model])
      if @cars != []
        render json: @cars
      else
        render json: { errors: "No cars were found!" }
      end
    end

    private

    def search_querie_params
      params.require(:search_params).permit(:make)
    end

end
