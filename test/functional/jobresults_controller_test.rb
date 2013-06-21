require 'test_helper'

class JobresultsControllerTest < ActionController::TestCase
  setup do
    @jobresult = jobresults(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jobresults)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jobresult" do
    assert_difference('Jobresult.count') do
      post :create, jobresult: {  }
    end

    assert_redirected_to jobresult_path(assigns(:jobresult))
  end

  test "should show jobresult" do
    get :show, id: @jobresult
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @jobresult
    assert_response :success
  end

  test "should update jobresult" do
    put :update, id: @jobresult, jobresult: {  }
    assert_redirected_to jobresult_path(assigns(:jobresult))
  end

  test "should destroy jobresult" do
    assert_difference('Jobresult.count', -1) do
      delete :destroy, id: @jobresult
    end

    assert_redirected_to jobresults_path
  end
end
