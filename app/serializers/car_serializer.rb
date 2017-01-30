class CarSerializer < ActiveModel::Serializer
  attributes :id, :year, :make, :model, :km, :tran, :fuel_type, :price, :plate_num, :color, :image

end
