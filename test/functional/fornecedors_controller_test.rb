require 'test_helper'

class FornecedorsControllerTest < ActionController::TestCase
  setup do
    @fornecedor = fornecedors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fornecedors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fornecedor" do
    assert_difference('Fornecedor.count') do
      post :create, fornecedor: @fornecedor.attributes
    end

    assert_redirected_to fornecedor_path(assigns(:fornecedor))
  end

  test "should show fornecedor" do
    get :show, id: @fornecedor.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fornecedor.to_param
    assert_response :success
  end

  test "should update fornecedor" do
    put :update, id: @fornecedor.to_param, fornecedor: @fornecedor.attributes
    assert_redirected_to fornecedor_path(assigns(:fornecedor))
  end

  test "should destroy fornecedor" do
    assert_difference('Fornecedor.count', -1) do
      delete :destroy, id: @fornecedor.to_param
    end

    assert_redirected_to fornecedors_path
  end
end
