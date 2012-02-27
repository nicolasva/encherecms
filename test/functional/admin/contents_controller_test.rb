require 'test_helper'

class Admin::ContentsControllerTest < ActionController::TestCase
  setup do
    @admin_content = admin_contents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_contents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_content" do
    assert_difference('Admin::Content.count') do
      post :create, admin_content: @admin_content.attributes
    end

    assert_redirected_to admin_content_path(assigns(:admin_content))
  end

  test "should show admin_content" do
    get :show, id: @admin_content
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_content
    assert_response :success
  end

  test "should update admin_content" do
    put :update, id: @admin_content, admin_content: @admin_content.attributes
    assert_redirected_to admin_content_path(assigns(:admin_content))
  end

  test "should destroy admin_content" do
    assert_difference('Admin::Content.count', -1) do
      delete :destroy, id: @admin_content
    end

    assert_redirected_to admin_contents_path
  end
end
