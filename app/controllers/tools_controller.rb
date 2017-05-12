class ToolsController < ApplicationController
  before_action :set_tool, only: [:show, :update, :destroy]
  before_action :authenticate


  # GET /tool
  def index
    @tool = Tool.all
    render json: @tool, :root => false
  end

  # GET /tool/1
  def show
    render json: @tool
  end

  # POST /tool
  def create
    @tool = Tool.new(tool_params)

    if @tool.save
      params[:tool][:image].each do |file|
        @tool.tool_photos.create!(:document => file)
      end
      render json: @tool, status: :created, location: @tool
    else
      render json: @tool.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tool/1
  def update
    if @tool.update(tool_params)
      render json: @tool
    else
      render json: @tool.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tool/1
  def destroy
    @tool.destroy
  end

  def search_tools
    binding.pry
    @tool = Tool.where(category: params[:tool][:search].order(created_at: :desc))
    render json: @tool
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tool
      @tool = Tool.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tool_params
      params.require(:tool).permit(:price, :tool_type, :category, :brand, :description, :condition, :location, :user_id)
    end
end
