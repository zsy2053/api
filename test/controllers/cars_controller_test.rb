require 'test_helper'

class CarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @car = cars(:one)
  end

  test "should get index" do
    get cars_url
    assert_response :success
  end

  test "should create car" do
    assert_difference('Car.count') do
      post cars_url, params: { car: {  } }
    end

    assert_response 201
  end

  test "should show car" do
    get car_url(@car)
    assert_response :success
  end

  test "should update car" do
    patch car_url(@car), params: { car: {  } }
    assert_response 200
  end

  test "should destroy car" do
    assert_difference('Car.count', -1) do
      delete car_url(@car)
    end

    assert_response 204
  end
end
