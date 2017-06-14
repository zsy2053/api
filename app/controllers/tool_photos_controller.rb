class ToolPhotosController < ApplicationController

  def create
    blob_name = build_blob_name
    container = 'tool-images'
    blob_url = '/' + container + '/' + blob_name
    upload_blob(params[:tool][:image], container, blob_name)
    @tool_photo = ToolPhoto.create(tool_id: params[:tool][:id], url: blob_url)
    if @tool_photo.save
      render json: @tool_photo, status: :created
    else
      render json: @tool_photo.errors, status: :unprocessable_entity
    end
  end

  private

  def build_blob_name
    # Find number of tool_photos and + 1 to incriment  a new one
    tool_photo_number = Tool.find(params[:tool][:id]).tool_photos.length + 1
    #  "(TOOL_ID)/photo(num_tool_photo).(file_extension)"
    "#{params[:tool][:id]}/photo#{tool_photo_number}.#{params[:tool][:fileExt]}"
  end

  def upload_blob(image, container, blob_name)
    decoded_image = Base64.decode64(image[:data])
    client = Azure::Storage::Client.create(:storage_account_name => "borostorage",
                                           :storage_access_key => "X9WSR1/ynmhy0FidgABmWGR3t5vmjgft46RJ7KAz5svGM1a7s4PbNy/Cq76dy3hbZZpESPr7OjktPoEhr+6x+A==")
    options = { :client => client }
    blobs = Azure::Storage::Blob::BlobService.new options
    content = File.open(image[:fileName], 'rb') { |f|
      f.read
    }
    blobs.create_block_blob(container, blob_name, content)
  end
end
