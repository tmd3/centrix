require 'test_helper'

class InsuranceCosControllerTest < ActionController::TestCase
  setup do
    @insurance_co = insurance_cos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:insurance_cos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create insurance_co" do
    assert_difference('InsuranceCo.count') do
      post :create, :insurance_co => @insurance_co.attributes
    end

    assert_redirected_to insurance_co_path(assigns(:insurance_co))
  end

  test "should show insurance_co" do
    get :show, :id => @insurance_co.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @insurance_co.to_param
    assert_response :success
  end

  test "should update insurance_co" do
    put :update, :id => @insurance_co.to_param, :insurance_co => @insurance_co.attributes
    assert_redirected_to insurance_co_path(assigns(:insurance_co))
  end

  test "should destroy insurance_co" do
    assert_difference('InsuranceCo.count', -1) do
      delete :destroy, :id => @insurance_co.to_param
    end

    assert_redirected_to insurance_cos_path
  end
end
