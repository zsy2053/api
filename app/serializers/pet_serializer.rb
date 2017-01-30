class PetSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :image
end
