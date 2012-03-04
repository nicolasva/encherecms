require 'test_helper'

class TitleproductsControllerTest < ActionController::TestCase
  setup do
    @titleproduct = titleproducts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:titleproducts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create titleproduct" do
    assert_difference('Titleproduct.count') do
      post :create, titleproduct: @titleproduct.attributes
    end

    assert_redirected_to titleproduct_path(assigns(:titleproduct))
  end

  test "should show titleproduct" do
    get :show, id: @titleproduct
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @titleproduct
    assert_response :success
  end

  test "should update titleproduct" do
    put :update, id: @titleproduct, titleproduct: @titleproduct.attributes
    assert_redirected_to titleproduct_path(assigns(:titleproduct))
  end

  test "should destroy titleproduct" do
    assert_difference('Titleproduct.count', -1) do
      delete :destroy, id: @titleproduct
    end

    assert_redirected_to titleproducts_path
  end
end
