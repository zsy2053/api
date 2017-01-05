class Car < ApplicationRecord
  belongs_to :user

  validates :year, presence: true
  validates :make, presence: true
  validates :model, presence: true
  validates :km, presence: true
  validates :tran, presence: true
  validates :fuel_type, presence: true
  validates :price, presence: true
  validates :plate_num, presence: true
  validates :color, presence: true
end
