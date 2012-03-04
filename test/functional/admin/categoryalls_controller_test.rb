require 'test_helper'

class Admin::CategoryallsControllerTest < ActionController::TestCase
  setup do
    @admin_categoryall = admin_categoryalls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_categoryalls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_categoryall" do
    assert_difference('Admin::Categoryall.count') do
      post :create, admin_categoryall: @admin_categoryall.attributes
    end

    assert_redirected_to admin_categoryall_path(assigns(:admin_categoryall))
  end

  test "should show admin_categoryall" do
    get :show, id: @admin_categoryall
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_categoryall
    assert_response :success
  end

  test "should update admin_categoryall" do
    put :update, id: @admin_categoryall, admin_categoryall: @admin_categoryall.attributes
    assert_redirected_to admin_categoryall_path(assigns(:admin_categoryall))
  end

  test "should destroy admin_categoryall" do
    assert_difference('Admin::Categoryall.count', -1) do
      delete :destroy, id: @admin_categoryall
    end

    assert_redirected_to admin_categoryalls_path
  end
end
