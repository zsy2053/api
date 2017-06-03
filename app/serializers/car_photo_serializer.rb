class CarPhotoSerializer < ActiveModel::Serializer
  attributes :id, :car_id, :image_url

  def image_url
    'localhost:3000'+ object.image.url
  end
end
