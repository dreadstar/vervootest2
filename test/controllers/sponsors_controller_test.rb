require 'test_helper'

class SponsorsControllerTest < ActionController::TestCase
  setup do
    @sponsor = sponsors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sponsors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sponsor" do
    assert_difference('Sponsor.count') do
      post :create, sponsor: { address1: @sponsor.address1, address2: @sponsor.address2, city: @sponsor.city, country: @sponsor.country, email: @sponsor.email, enabled: @sponsor.enabled, img_thumb_url: @sponsor.img_thumb_url, img_url: @sponsor.img_url, name: @sponsor.name, phone_number: @sponsor.phone_number, postal_code: @sponsor.postal_code, province: @sponsor.province, seo_name: @sponsor.seo_name, state: @sponsor.state, website: @sponsor.website }
    end

    assert_redirected_to sponsor_path(assigns(:sponsor))
  end

  test "should show sponsor" do
    get :show, id: @sponsor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sponsor
    assert_response :success
  end

  test "should update sponsor" do
    patch :update, id: @sponsor, sponsor: { address1: @sponsor.address1, address2: @sponsor.address2, city: @sponsor.city, country: @sponsor.country, email: @sponsor.email, enabled: @sponsor.enabled, img_thumb_url: @sponsor.img_thumb_url, img_url: @sponsor.img_url, name: @sponsor.name, phone_number: @sponsor.phone_number, postal_code: @sponsor.postal_code, province: @sponsor.province, seo_name: @sponsor.seo_name, state: @sponsor.state, website: @sponsor.website }
    assert_redirected_to sponsor_path(assigns(:sponsor))
  end

  test "should destroy sponsor" do
    assert_difference('Sponsor.count', -1) do
      delete :destroy, id: @sponsor
    end

    assert_redirected_to sponsors_path
  end
end
