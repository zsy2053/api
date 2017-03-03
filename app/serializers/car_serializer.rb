class CarSerializer < ActiveModel::Serializer
  attributes :id, :year, :make, :model, :km, :tran, :fuel_type, :weekday_price,:weekend_price, :plate_num, :color
  has_many :car_photos
end
