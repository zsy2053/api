class UsersController < ApplicationController
  include ErrorSerializer
  # skip_before_action :authenticate_user, only: [:create]

  def index
    render json: User.all
  end

  def show
    render json: User.find(params[:id])
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: {user: user}, status: 200
    else
      render json: ErrorSerializer.serialize(user.errors), status: 422
    end
  end

  # GET cars pertaining to user
  def user_cars
    @cars = Car.where(user_id: params[:id])
    render json: @cars
  end

  private

    def user_params
      params.require(:user).permit(:id, :email, :password, :password_confirmation)
    end


end
