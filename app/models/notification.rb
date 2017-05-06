class Notification < ApplicationRecord
  belongs_to :booking

  validates :user_id, presence: true
  validates :booking_id, presence: true
  validates :sender, presence: true
  validates :title, presence: true
end
