require 'test_helper'

class ForestsControllerTest < ActionController::TestCase
  setup do
    @forest = forests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:forests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create forest" do
    assert_difference('Forest.count') do
      post :create, :forest => @forest.attributes
    end

    assert_redirected_to forest_path(assigns(:forest))
  end

  test "should show forest" do
    get :show, :id => @forest.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @forest.to_param
    assert_response :success
  end

  test "should update forest" do
    put :update, :id => @forest.to_param, :forest => @forest.attributes
    assert_redirected_to forest_path(assigns(:forest))
  end

  test "should destroy forest" do
    assert_difference('Forest.count', -1) do
      delete :destroy, :id => @forest.to_param
    end

    assert_redirected_to forests_path
  end
end
