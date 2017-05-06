class NotificationSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :booking_id, :sender, :title, :body
  has_one :booking
end
