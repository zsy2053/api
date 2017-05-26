class ToolPhotoSerializer < ActiveModel::Serializer
  attributes :id, :tool_id, :image_url

  def image_url
    if object.image_url
      'localhost:3000'+ object.image_url
    end
    nil
  end
end
