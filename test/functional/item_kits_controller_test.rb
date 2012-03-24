require 'test_helper'

class ItemKitsControllerTest < ActionController::TestCase
  setup do
    @item_kit = item_kits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_kits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_kit" do
    assert_difference('ItemKit.count') do
      post :create, item_kit: @item_kit.attributes
    end

    assert_redirected_to item_kit_path(assigns(:item_kit))
  end

  test "should show item_kit" do
    get :show, id: @item_kit.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_kit.to_param
    assert_response :success
  end

  test "should update item_kit" do
    put :update, id: @item_kit.to_param, item_kit: @item_kit.attributes
    assert_redirected_to item_kit_path(assigns(:item_kit))
  end

  test "should destroy item_kit" do
    assert_difference('ItemKit.count', -1) do
      delete :destroy, id: @item_kit.to_param
    end

    assert_redirected_to item_kits_path
  end
end
