require 'test_helper'

class VervoomControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get challenges" do
    get :challenges
    assert_response :success
  end

  test "should get users" do
    get :users
    assert_response :success
  end

  test "should get sponsors" do
    get :sponsors
    assert_response :success
  end

  test "should get nonprofits" do
    get :nonprofits
    assert_response :success
  end

end
