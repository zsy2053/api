class NotificationsController < ApplicationController
  before_action :authenticate 

  def index
    @notifications = Notification.all
    render json: @notifications, :root => false
  end

  def create
    @notification = Booking.new(notification_params)

    if @notification.save
      render json: @notification, status: :created, :root => false
    else
      render json: @notification.errors, status: :unprocessable_entity
    end
  end

  def userNotifications
    @notifications = Notification.where(user_id: params[:id])
    render json: @notifications, include: 'booking.**', :root => false
  end

  private

  # Only allow a trusted parameter "white list" through.
  def notification_params
    params.require(:notification).permit(:user_id, :tool_id, :sender, :title, :body)
  end
end
