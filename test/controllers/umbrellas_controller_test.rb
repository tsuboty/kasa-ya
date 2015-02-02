require 'test_helper'

class UmbrellasControllerTest < ActionController::TestCase
  setup do
    @umbrella = umbrellas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:umbrellas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create umbrella" do
    assert_difference('Umbrella.count') do
      post :create, umbrella: { gps_lat: @umbrella.gps_lat, gps_lon: @umbrella.gps_lon, status: @umbrella.status }
    end

    assert_redirected_to umbrella_path(assigns(:umbrella))
  end

  test "should show umbrella" do
    get :show, id: @umbrella
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @umbrella
    assert_response :success
  end

  test "should update umbrella" do
    patch :update, id: @umbrella, umbrella: { gps_lat: @umbrella.gps_lat, gps_lon: @umbrella.gps_lon, status: @umbrella.status }
    assert_redirected_to umbrella_path(assigns(:umbrella))
  end

  test "should destroy umbrella" do
    assert_difference('Umbrella.count', -1) do
      delete :destroy, id: @umbrella
    end

    assert_redirected_to umbrellas_path
  end
end
