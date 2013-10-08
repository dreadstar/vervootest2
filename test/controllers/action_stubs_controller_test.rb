require 'test_helper'

class ActionStubsControllerTest < ActionController::TestCase
  setup do
    @action_stub = action_stubs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:action_stubs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create action_stub" do
    assert_difference('ActionStub.count') do
      post :create, action_stub: { amt: @action_stub.amt, challenge_id: @action_stub.challenge_id, description: @action_stub.description, enabled: @action_stub.enabled, heir: @action_stub.heir, heir_type: @action_stub.heir_type, name: @action_stub.name }
    end

    assert_redirected_to action_stub_path(assigns(:action_stub))
  end

  test "should show action_stub" do
    get :show, id: @action_stub
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @action_stub
    assert_response :success
  end

  test "should update action_stub" do
    patch :update, id: @action_stub, action_stub: { amt: @action_stub.amt, challenge_id: @action_stub.challenge_id, description: @action_stub.description, enabled: @action_stub.enabled, heir: @action_stub.heir, heir_type: @action_stub.heir_type, name: @action_stub.name }
    assert_redirected_to action_stub_path(assigns(:action_stub))
  end

  test "should destroy action_stub" do
    assert_difference('ActionStub.count', -1) do
      delete :destroy, id: @action_stub
    end

    assert_redirected_to action_stubs_path
  end
end
