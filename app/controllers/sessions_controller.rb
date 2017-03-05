class SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:email].downcase)
      if user && user.authenticate(params[:password])
      if user.email_confirmed
          sign_in user
        render json: user
      else
        flash.now[:error] = 'Please activate your account by following the
        instructions in the account confirmation email you received to proceed'
        render json: flash
      end
      else
        flash.now[:error] = 'Invalid email/password combination' # Not quite right!
        render json: flash
      end
  end

  def destroy
    session.delete(:user_id)
  end

end
