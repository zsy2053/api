class User < ApplicationRecord
  # Include default devise modules.
  devise  :validatable

  has_many :cars
  has_many :bookings
  has_many :sales

  mount_uploader :image, ImageUploader
  validates_processing_of :image
  validate :image_size_validation
  validates :email, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }, uniqueness: true

  def generate_json_api_error
    json_error = {"errors": []}
    errors.messages.each do |err_type, messages|
      messages.each do |msg|
        json_error[:errors] << {"detail": "#{err_type} #{msg}", "source": {"pointer": "user/err_type"}}
      end
    end
    json_error
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  private
    def image_size_validation
      errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
    end
end
