class CarsController < ApplicationController
  before_action :set_car, only: [:show, :update, :destroy]
  skip_before_action :authenticate_user, only: [:show, :index]

  # GET /cars
  def index
    @cars = Car.all

    render json: @cars
  end

  # GET /cars/1
  def show
    render json: @car
  end

  # POST /cars
  def create
    @car = Car.new(car_params)

    if @car.save
      render json: @car, status: :created, location: @car
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cars/1
  def update
    if @car.update(car_params)
      render json: @car
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cars/1
  def destroy
    if @car.destroy
      render json: "Car has been deleted."
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def car_params
      params.require(:car).permit(:year, :make, :model, :km, :tran, :fuel_type, :price, :plate_num, :color, :user_id)
    end
end
