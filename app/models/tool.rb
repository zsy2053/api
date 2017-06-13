class Tool < ApplicationRecord

  belongs_to :user
  has_many :bookings
  has_many :tool_photos

  validates :tool_type, presence: true
  validates :category, presence: true
  validates :price, presence: true
  validates :brand, presence: true
  validates :condition, presence: true
  validates :power, presence: true
end
