require 'test_helper'

class ContenusControllerTest < ActionController::TestCase
  setup do
    @contenu = contenus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contenus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contenu" do
    assert_difference('Contenu.count') do
      post :create, contenu: @contenu.attributes
    end

    assert_redirected_to contenu_path(assigns(:contenu))
  end

  test "should show contenu" do
    get :show, id: @contenu
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contenu
    assert_response :success
  end

  test "should update contenu" do
    put :update, id: @contenu, contenu: @contenu.attributes
    assert_redirected_to contenu_path(assigns(:contenu))
  end

  test "should destroy contenu" do
    assert_difference('Contenu.count', -1) do
      delete :destroy, id: @contenu
    end

    assert_redirected_to contenus_path
  end
end
