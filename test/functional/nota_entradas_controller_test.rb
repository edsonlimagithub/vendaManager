require 'test_helper'

class NotaEntradasControllerTest < ActionController::TestCase
  setup do
    @nota_entrada = nota_entradas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nota_entradas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nota_entrada" do
    assert_difference('NotaEntrada.count') do
      post :create, nota_entrada: @nota_entrada.attributes
    end

    assert_redirected_to nota_entrada_path(assigns(:nota_entrada))
  end

  test "should show nota_entrada" do
    get :show, id: @nota_entrada.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nota_entrada.to_param
    assert_response :success
  end

  test "should update nota_entrada" do
    put :update, id: @nota_entrada.to_param, nota_entrada: @nota_entrada.attributes
    assert_redirected_to nota_entrada_path(assigns(:nota_entrada))
  end

  test "should destroy nota_entrada" do
    assert_difference('NotaEntrada.count', -1) do
      delete :destroy, id: @nota_entrada.to_param
    end

    assert_redirected_to nota_entradas_path
  end
end
