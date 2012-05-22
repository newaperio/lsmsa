require 'test_helper'

class ProspiesControllerTest < ActionController::TestCase
  setup do
    @prospy = prospies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prospies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prospy" do
    assert_difference('Prospy.count') do
      post :create, prospy: @prospy.attributes
    end

    assert_redirected_to prospy_path(assigns(:prospy))
  end

  test "should show prospy" do
    get :show, id: @prospy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prospy
    assert_response :success
  end

  test "should update prospy" do
    put :update, id: @prospy, prospy: @prospy.attributes
    assert_redirected_to prospy_path(assigns(:prospy))
  end

  test "should destroy prospy" do
    assert_difference('Prospy.count', -1) do
      delete :destroy, id: @prospy
    end

    assert_redirected_to prospies_path
  end
end
