class ApplicationController < ActionController::API
  include Knock::Authenticable
  before_action :authenticate_user
  load_and_authorize_resource


end
