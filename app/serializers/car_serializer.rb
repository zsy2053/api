class CarSerializer < ActiveModel::Serializer
  attributes :id, :year, :make, :model, :km, :tran, :fuel_type, :weekday_price,:weekend_price, :plate_num, :color, :description
  has_many :car_photos
end
