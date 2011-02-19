require 'test_helper'

class BranchesControllerTest < ActionController::TestCase
  setup do
    @branch = leaves(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leaves)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create leaf" do
    assert_difference('Leaf.count') do
      post :create, :branch => @branch.attributes
    end

    assert_redirected_to leaf_path(assigns(:branch))
  end

  test "should show leaf" do
    get :show, :id => @branch.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @branch.to_param
    assert_response :success
  end

  test "should update leaf" do
    put :update, :id => @branch.to_param, :branch => @branch.attributes
    assert_redirected_to leaf_path(assigns(:branch))
  end

  test "should destroy leaf" do
    assert_difference('Leaf.count', -1) do
      delete :destroy, :id => @branch.to_param
    end

    assert_redirected_to leaves_path
  end
end
