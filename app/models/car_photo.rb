class CarPhoto < ApplicationRecord
  belongs_to :car#, counter_cache: true

  mount_uploader :image, ImageUploader

  validates_processing_of :image
  validate :image_size_validation

  private
    def image_size_validation
      errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
    end
end
