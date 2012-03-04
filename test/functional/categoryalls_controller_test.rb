require 'test_helper'

class CategoryallsControllerTest < ActionController::TestCase
  setup do
    @categoryall = categoryalls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categoryalls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create categoryall" do
    assert_difference('Categoryall.count') do
      post :create, categoryall: @categoryall.attributes
    end

    assert_redirected_to categoryall_path(assigns(:categoryall))
  end

  test "should show categoryall" do
    get :show, id: @categoryall
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @categoryall
    assert_response :success
  end

  test "should update categoryall" do
    put :update, id: @categoryall, categoryall: @categoryall.attributes
    assert_redirected_to categoryall_path(assigns(:categoryall))
  end

  test "should destroy categoryall" do
    assert_difference('Categoryall.count', -1) do
      delete :destroy, id: @categoryall
    end

    assert_redirected_to categoryalls_path
  end
end
