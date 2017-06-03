class ToolPhotoSerializer < ActiveModel::Serializer
  attributes :id, :tool_id, :image_url

  def image_url
    if object.image.url
      'localhost:3000'+ object.image.url
    end
    nil
  end
end
