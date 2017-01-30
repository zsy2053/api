class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :year, presence: true
  validates :make, presence: true
  validates :model, presence: true
  validates :km, presence: true
  validates :tran, presence: true
  validates :fuel_type, presence: true
  validates :price, presence: true
  validates :plate_num, presence: true
  validates :color, presence: true

  mount_uploader :image, ImageUploader
  validates_processing_of :image
  validate :image_size_validation
  
  private
    def image_size_validation
      errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
    end
end
