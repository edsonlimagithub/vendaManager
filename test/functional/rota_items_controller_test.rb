require 'test_helper'

class RotaItemsControllerTest < ActionController::TestCase
  setup do
    @rota_item = rota_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rota_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rota_item" do
    assert_difference('RotaItem.count') do
      post :create, rota_item: @rota_item.attributes
    end

    assert_redirected_to rota_item_path(assigns(:rota_item))
  end

  test "should show rota_item" do
    get :show, id: @rota_item.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rota_item.to_param
    assert_response :success
  end

  test "should update rota_item" do
    put :update, id: @rota_item.to_param, rota_item: @rota_item.attributes
    assert_redirected_to rota_item_path(assigns(:rota_item))
  end

  test "should destroy rota_item" do
    assert_difference('RotaItem.count', -1) do
      delete :destroy, id: @rota_item.to_param
    end

    assert_redirected_to rota_items_path
  end
end
