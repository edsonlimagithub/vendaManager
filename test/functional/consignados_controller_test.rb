require 'test_helper'

class ConsignadosControllerTest < ActionController::TestCase
  setup do
    @consignado = consignados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:consignados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create consignado" do
    assert_difference('Consignado.count') do
      post :create, consignado: @consignado.attributes
    end

    assert_redirected_to consignado_path(assigns(:consignado))
  end

  test "should show consignado" do
    get :show, id: @consignado.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @consignado.to_param
    assert_response :success
  end

  test "should update consignado" do
    put :update, id: @consignado.to_param, consignado: @consignado.attributes
    assert_redirected_to consignado_path(assigns(:consignado))
  end

  test "should destroy consignado" do
    assert_difference('Consignado.count', -1) do
      delete :destroy, id: @consignado.to_param
    end

    assert_redirected_to consignados_path
  end
end
