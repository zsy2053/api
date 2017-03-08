class User < ApplicationRecord
  # Include default devise modules.
  before_create :confirmation_token
  devise  :validatable
  has_secure_password
  has_many :cars
  has_many :bookings
  has_many :sales

  mount_uploader :image, ImageUploader
  mount_uploader :avatar, AvatarUploader
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

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def name
    self.first_name + " " + self.last_name
  end

  private

    def image_size_validation
      errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
    end

    def confirmation_token
      if self.confirm_token.blank?
          self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
    end
end
