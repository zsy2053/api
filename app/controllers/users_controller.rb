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

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end


end
