class UsersController < ApplicationController
  include ErrorSerializer
  before_action :authenticate, except: [:create, :confirm_email, :email_activate]

  def index
    render json: User.all
  end

  def show
    render json: User.find(params[:id])
  end

  def create
    user = User.new(user_params)
    if user.save
      UserMailer.registration_confirmation(user).deliver
      render json: {user: user}, status: 200, :root => false
    else
      render json: ErrorSerializer.serialize(user.errors), status: 422
    end
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: "User with id: #{user.id} has been updated"
    else
      render json: ErrorSerializer.serialize(user.errors)
    end
  end

  # EMAIL
  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      render json: "Sign in to confirm email!"
    else
      render json: "User doesn't exist"
    end
  end

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end

  private

    def user_params
      params.require(:user).permit(:id, :email, :password, :password_confirmation, :gender, :age, :image, :first_name, :last_name, :register_complete, :has_booked)
    end


end
