require 'test_helper'

class ItemConsignadosControllerTest < ActionController::TestCase
  setup do
    @item_consignado = item_consignados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_consignados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_consignado" do
    assert_difference('ItemConsignado.count') do
      post :create, item_consignado: @item_consignado.attributes
    end

    assert_redirected_to item_consignado_path(assigns(:item_consignado))
  end

  test "should show item_consignado" do
    get :show, id: @item_consignado.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_consignado.to_param
    assert_response :success
  end

  test "should update item_consignado" do
    put :update, id: @item_consignado.to_param, item_consignado: @item_consignado.attributes
    assert_redirected_to item_consignado_path(assigns(:item_consignado))
  end

  test "should destroy item_consignado" do
    assert_difference('ItemConsignado.count', -1) do
      delete :destroy, id: @item_consignado.to_param
    end

    assert_redirected_to item_consignados_path
  end
end
