class ToolSerializer < ActiveModel::Serializer
  attributes :id, :tool_type, :category, :price, :brand, :description, :condition, :location, :power, :user_id
  has_many :tool_photos
end
