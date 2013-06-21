require 'test_helper'

class JobdetailsControllerTest < ActionController::TestCase
  setup do
    @jobdetail = jobdetails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jobdetails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jobdetail" do
    assert_difference('Jobdetail.count') do
      post :create, jobdetail: {  }
    end

    assert_redirected_to jobdetail_path(assigns(:jobdetail))
  end

  test "should show jobdetail" do
    get :show, id: @jobdetail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @jobdetail
    assert_response :success
  end

  test "should update jobdetail" do
    put :update, id: @jobdetail, jobdetail: {  }
    assert_redirected_to jobdetail_path(assigns(:jobdetail))
  end

  test "should destroy jobdetail" do
    assert_difference('Jobdetail.count', -1) do
      delete :destroy, id: @jobdetail
    end

    assert_redirected_to jobdetails_path
  end
end
