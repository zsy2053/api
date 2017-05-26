class ToolsController < ApplicationController
  before_action :set_tool, only: [:show, :update, :destroy]
  before_action :authenticate


  # GET /tool
  def index
    @tool = Tool.all
    render json: @tool, :root => false
  end

  #GET /tool/search_tools
  def search_tools
    @tool = Tool.where(category: params[:category]).order(created_at: :desc)
    render json: @tool
  end

  # GET /tool/1
  def show
    render json: @tool
  end

  # POST /tool
  def create
    @tool = Tool.create(tool_params)
    if @tool.save
      render json: @tool, status: :created, location: @tool
    else
      render json: @tool.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tool/1
  def update
    if @tool.update(tool_params)
      binding.pry
      if params[:tool][:image]
        @tool.tool_photos.create!(:image => decode_photo_data(params[:tool][:image]))
      end
      render json: @tool
    else
      render json: @tool.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tool/1
  def destroy
    @tool.destroy
  end

  private

  #decode base64 data to an jpg image:
   def decode_photo_data(photo_data)
      data = StringIO.new(Base64.decode64(photo_data))

      data.class.class_eval { attr_accessor :original_filename, :content_type }
      data.original_filename = "upload.jpg"
      data.content_type = "image/jpg"

         # return decoded data
      data
   end

    # Use callbacks to share common setup or constraints between actions.
    def set_tool
      @tool = Tool.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tool_params
      params.require(:tool).permit(:price, :tool_type, :category, :brand, :description, :condition, :location, :user_id, :power)
    end
end
