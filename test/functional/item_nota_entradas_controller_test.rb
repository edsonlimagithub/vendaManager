require 'test_helper'

class ItemNotaEntradasControllerTest < ActionController::TestCase
  setup do
    @item_nota_entrada = item_nota_entradas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_nota_entradas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_nota_entrada" do
    assert_difference('ItemNotaEntrada.count') do
      post :create, item_nota_entrada: @item_nota_entrada.attributes
    end

    assert_redirected_to item_nota_entrada_path(assigns(:item_nota_entrada))
  end

  test "should show item_nota_entrada" do
    get :show, id: @item_nota_entrada.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_nota_entrada.to_param
    assert_response :success
  end

  test "should update item_nota_entrada" do
    put :update, id: @item_nota_entrada.to_param, item_nota_entrada: @item_nota_entrada.attributes
    assert_redirected_to item_nota_entrada_path(assigns(:item_nota_entrada))
  end

  test "should destroy item_nota_entrada" do
    assert_difference('ItemNotaEntrada.count', -1) do
      delete :destroy, id: @item_nota_entrada.to_param
    end

    assert_redirected_to item_nota_entradas_path
  end
end
