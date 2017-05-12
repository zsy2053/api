class IdPhotosController < ApplicationController

  def create
    id_photo = Id_photo.new(id_photo_params)
    if id_photo.save
      render json: {idPhoto: id_photo}, status: 200, :root => false
    else
      render json: ErrorSerializer.serialize(user.errors), status: 422
    end
  end
  
  private

  def id_photo_params
    params.require(:id_photo).permit(:id, :user_id, :image, :exp, :first_name, :last_name, :address)
  end
end
