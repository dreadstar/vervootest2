require 'test_helper'

class ChallengesControllerTest < ActionController::TestCase
  setup do
    @challenge = challenges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:challenges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create challenge" do
    assert_difference('Challenge.count') do
      post :create, challenge: { amount_raised: @challenge.amount_raised, challenge_img: @challenge.challenge_img, charity_blurb: @challenge.charity_blurb, description: @challenge.description, enabled: @challenge.enabled, end_date: @challenge.end_date, img_thumb_url: @challenge.img_thumb_url, logo_url: @challenge.logo_url, name: @challenge.name, seo_name: @challenge.seo_name, sponsor_blurb: @challenge.sponsor_blurb, start_date: @challenge.start_date, total_offer: @challenge.total_offer }
    end

    assert_redirected_to challenge_path(assigns(:challenge))
  end

  test "should show challenge" do
    get :show, id: @challenge
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @challenge
    assert_response :success
  end

  test "should update challenge" do
    patch :update, id: @challenge, challenge: { amount_raised: @challenge.amount_raised, challenge_img: @challenge.challenge_img, charity_blurb: @challenge.charity_blurb, description: @challenge.description, enabled: @challenge.enabled, end_date: @challenge.end_date, img_thumb_url: @challenge.img_thumb_url, logo_url: @challenge.logo_url, name: @challenge.name, seo_name: @challenge.seo_name, sponsor_blurb: @challenge.sponsor_blurb, start_date: @challenge.start_date, total_offer: @challenge.total_offer }
    assert_redirected_to challenge_path(assigns(:challenge))
  end

  test "should destroy challenge" do
    assert_difference('Challenge.count', -1) do
      delete :destroy, id: @challenge
    end

    assert_redirected_to challenges_path
  end
end
