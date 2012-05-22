require 'test_helper'

class ConcentrationsControllerTest < ActionController::TestCase
  setup do
    @concentration = concentrations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:concentrations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create concentration" do
    assert_difference('Concentration.count') do
      post :create, concentration: @concentration.attributes
    end

    assert_redirected_to concentration_path(assigns(:concentration))
  end

  test "should show concentration" do
    get :show, id: @concentration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @concentration
    assert_response :success
  end

  test "should update concentration" do
    put :update, id: @concentration, concentration: @concentration.attributes
    assert_redirected_to concentration_path(assigns(:concentration))
  end

  test "should destroy concentration" do
    assert_difference('Concentration.count', -1) do
      delete :destroy, id: @concentration
    end

    assert_redirected_to concentrations_path
  end
end
