require 'test_helper'

class ToolControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tool = tool(:one)
  end

  test "should get index" do
    get tool_index_url, as: :json
    assert_response :success
  end

  test "should create tool" do
    assert_difference('Tool.count') do
      post tool_index_url, params: { tool: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show tool" do
    get tool_url(@tool), as: :json
    assert_response :success
  end

  test "should update tool" do
    patch tool_url(@tool), params: { tool: {  } }, as: :json
    assert_response 200
  end

  test "should destroy tool" do
    assert_difference('Tool.count', -1) do
      delete tool_url(@tool), as: :json
    end

    assert_response 204
  end
end
