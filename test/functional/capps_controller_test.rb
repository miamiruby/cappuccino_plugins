require 'test_helper'

class CappsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:capps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create capp" do
    assert_difference('Capp.count') do
      post :create, :capp => { }
    end

    assert_redirected_to capp_path(assigns(:capp))
  end

  test "should show capp" do
    get :show, :id => capps(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => capps(:one).to_param
    assert_response :success
  end

  test "should update capp" do
    put :update, :id => capps(:one).to_param, :capp => { }
    assert_redirected_to capp_path(assigns(:capp))
  end

  test "should destroy capp" do
    assert_difference('Capp.count', -1) do
      delete :destroy, :id => capps(:one).to_param
    end

    assert_redirected_to capps_path
  end
end
