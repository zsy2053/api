class BuildingsController < ApplicationController
  before_action :set_building, only: [:show, :update, :destroy]
  before_action :authenticate_user

  def index
    @building = Building.all
    render json: @building
  end

  def show
    render json: @building
  end

  def create
    @building = Building.new(building_params)
    if @building.save!
      render json: @building, status: :created, location: @building
    else
      render json: @building.errors, status: :unprocessable_entity
    end
  end

  def update
    if @building.update(building_params)
      render json: @building
    else
      render json: @building.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @building.destroy!
      render json: "Building has been deleted."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_building
      @building = Building.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def building_params
      params.require(:building).permit(:address, :postal_code, :city, :province, :phone_number, :num_units)
    end
end
