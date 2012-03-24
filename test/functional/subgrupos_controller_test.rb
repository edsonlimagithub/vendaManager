require 'test_helper'

class SubgruposControllerTest < ActionController::TestCase
  setup do
    @subgrupo = subgrupos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subgrupos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subgrupo" do
    assert_difference('Subgrupo.count') do
      post :create, subgrupo: @subgrupo.attributes
    end

    assert_redirected_to subgrupo_path(assigns(:subgrupo))
  end

  test "should show subgrupo" do
    get :show, id: @subgrupo.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subgrupo.to_param
    assert_response :success
  end

  test "should update subgrupo" do
    put :update, id: @subgrupo.to_param, subgrupo: @subgrupo.attributes
    assert_redirected_to subgrupo_path(assigns(:subgrupo))
  end

  test "should destroy subgrupo" do
    assert_difference('Subgrupo.count', -1) do
      delete :destroy, id: @subgrupo.to_param
    end

    assert_redirected_to subgrupos_path
  end
end
