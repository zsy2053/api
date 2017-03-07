class UsersController < ApplicationController
  include ErrorSerializer

  before_action :authenticate_user, except: [:create]

  def index
    render json: User.all
  end

  def show
    binding.pry
    render json: User.find(params[:id])
  end

  def create
    user = User.new(user_params)
    if user.save
      UserMailer.registration_confirmation(user).deliver
      render json: {user: user}, status: 200
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
      flash[:success] = "Welcome to the Sample App! Your email has been confirmed.
      Please sign in to continue."
      render json: flash
    else
      flash[:error] = "Sorry. User does not exist"
      render json: flash
    end
  end

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end

  private

    def user_params
      params.require(:user).permit(:id, :email, :password, :password_confirmation, :gender, :age, :image, :first_name, :last_name)
    end


end
