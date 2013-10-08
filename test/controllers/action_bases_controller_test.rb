require 'test_helper'

class ActionBasesControllerTest < ActionController::TestCase
  setup do
    @action_basis = action_bases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:action_bases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create action_basis" do
    assert_difference('ActionBase.count') do
      post :create, action_basis: { amt: @action_basis.amt, challenge_id: @action_basis.challenge_id, description: @action_basis.description, enabled: @action_basis.enabled, name: @action_basis.name }
    end

    assert_redirected_to action_basis_path(assigns(:action_basis))
  end

  test "should show action_basis" do
    get :show, id: @action_basis
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @action_basis
    assert_response :success
  end

  test "should update action_basis" do
    patch :update, id: @action_basis, action_basis: { amt: @action_basis.amt, challenge_id: @action_basis.challenge_id, description: @action_basis.description, enabled: @action_basis.enabled, name: @action_basis.name }
    assert_redirected_to action_basis_path(assigns(:action_basis))
  end

  test "should destroy action_basis" do
    assert_difference('ActionBase.count', -1) do
      delete :destroy, id: @action_basis
    end

    assert_redirected_to action_bases_path
  end
end
