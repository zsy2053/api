class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :address, :email, :age, :gender, :image, :has_booked
  has_many :id_photos
end
