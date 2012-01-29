require 'test_helper'

class InsCoOfficesControllerTest < ActionController::TestCase
  setup do
    @ins_co_office = ins_co_offices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ins_co_offices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ins_co_office" do
    assert_difference('InsCoOffice.count') do
      post :create, :ins_co_office => @ins_co_office.attributes
    end

    assert_redirected_to ins_co_office_path(assigns(:ins_co_office))
  end

  test "should show ins_co_office" do
    get :show, :id => @ins_co_office.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ins_co_office.to_param
    assert_response :success
  end

  test "should update ins_co_office" do
    put :update, :id => @ins_co_office.to_param, :ins_co_office => @ins_co_office.attributes
    assert_redirected_to ins_co_office_path(assigns(:ins_co_office))
  end

  test "should destroy ins_co_office" do
    assert_difference('InsCoOffice.count', -1) do
      delete :destroy, :id => @ins_co_office.to_param
    end

    assert_redirected_to ins_co_offices_path
  end
end
