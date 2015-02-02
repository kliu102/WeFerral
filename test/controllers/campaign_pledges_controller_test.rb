require 'test_helper'

class CampaignPledgesControllerTest < ActionController::TestCase
  setup do
    @campaign_pledge = campaign_pledges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:campaign_pledges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create campaign_pledge" do
    assert_difference('CampaignPledge.count') do
      post :create, campaign_pledge: {  }
    end

    assert_redirected_to campaign_pledge_path(assigns(:campaign_pledge))
  end

  test "should show campaign_pledge" do
    get :show, id: @campaign_pledge
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @campaign_pledge
    assert_response :success
  end

  test "should update campaign_pledge" do
    patch :update, id: @campaign_pledge, campaign_pledge: {  }
    assert_redirected_to campaign_pledge_path(assigns(:campaign_pledge))
  end

  test "should destroy campaign_pledge" do
    assert_difference('CampaignPledge.count', -1) do
      delete :destroy, id: @campaign_pledge
    end

    assert_redirected_to campaign_pledges_path
  end
end
