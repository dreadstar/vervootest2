require 'test_helper'

class NonprofitsControllerTest < ActionController::TestCase
  setup do
    @nonprofit = nonprofits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nonprofits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nonprofit" do
    assert_difference('Nonprofit.count') do
      post :create, nonprofit: { address1: @nonprofit.address1, address2: @nonprofit.address2, city: @nonprofit.city, country: @nonprofit.country, email: @nonprofit.email, enabled: @nonprofit.enabled, img_thumb_url: @nonprofit.img_thumb_url, img_url: @nonprofit.img_url, name: @nonprofit.name, phone_number: @nonprofit.phone_number, postal_code: @nonprofit.postal_code, province: @nonprofit.province, seo_name: @nonprofit.seo_name, state: @nonprofit.state, website: @nonprofit.website }
    end

    assert_redirected_to nonprofit_path(assigns(:nonprofit))
  end

  test "should show nonprofit" do
    get :show, id: @nonprofit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nonprofit
    assert_response :success
  end

  test "should update nonprofit" do
    patch :update, id: @nonprofit, nonprofit: { address1: @nonprofit.address1, address2: @nonprofit.address2, city: @nonprofit.city, country: @nonprofit.country, email: @nonprofit.email, enabled: @nonprofit.enabled, img_thumb_url: @nonprofit.img_thumb_url, img_url: @nonprofit.img_url, name: @nonprofit.name, phone_number: @nonprofit.phone_number, postal_code: @nonprofit.postal_code, province: @nonprofit.province, seo_name: @nonprofit.seo_name, state: @nonprofit.state, website: @nonprofit.website }
    assert_redirected_to nonprofit_path(assigns(:nonprofit))
  end

  test "should destroy nonprofit" do
    assert_difference('Nonprofit.count', -1) do
      delete :destroy, id: @nonprofit
    end

    assert_redirected_to nonprofits_path
  end
end
