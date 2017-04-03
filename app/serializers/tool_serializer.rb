class ToolSerializer < ActiveModel::Serializer
  attributes :id, :type, :category, :price, :brand, :description, :condition, :location
  has_many :tool_photos
end
