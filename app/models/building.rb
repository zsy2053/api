class Building < ApplicationRecord
  after_initialize :set_defaults, unless: :persisted?

  has_many :users
  has_many :cars

  validates :address, presence: true
  validates :phone_number, presence: true
  validates :city, presence: true
  validates :postal_code, presence: true
  validates :num_units, presence: true

  def set_defaults
    self.province  ||= 'Ontario'
  end
end
