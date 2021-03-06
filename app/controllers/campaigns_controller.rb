class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:refer]

  # GET /campaigns
  # GET /campaigns.json
  def index
    @campaigns = Campaign.all
  end

  # GET /campaigns/1
  # GET /campaigns/1.json
  def show
    @referral = @campaign.find_referral_by_user(current_user)
    @campaign.referral_uuid = params[:uuid]
    # save referral uuid in the field of messages in impressions
    impressionist(@campaign, params[:uuid])
  end

  def refer
    @campaign = Campaign.find_by_permalink(params[:permalink])
    referral = Referral.find_by_uuid(params[:referral_uuid])
    parent_id =
        if @campaign.is_referral_valid?(referral)
          referral.parent_id
        else
          nil
        end
    @campaign.referrals.create(:user_id => current_user.id, :parent_id => parent_id)
    redirect_to campaign_path(@campaign)
  end

  # GET /campaigns/new
  def new
    @campaign = Campaign.new
  end

  # GET /campaigns/1/edit
  def edit
  end

  # POST /campaigns
  # POST /campaigns.json
  def create
    @campaign = Campaign.new(campaign_params)

    respond_to do |format|
      if @campaign.save
        format.html { redirect_to @campaign, notice: 'Campaign was successfully created.' }
        format.json { render :show, status: :created, location: @campaign }
      else
        format.html { render :new }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campaigns/1
  # PATCH/PUT /campaigns/1.json
  def update
    respond_to do |format|
      if @campaign.update(campaign_params)
        format.html { redirect_to merchant_campaign_path(@campaign), notice: 'Campaign was successfully updated.' }
        format.json { render :show, status: :ok, location: @campaign }
      else
        format.html { render :edit }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaigns/1
  # DELETE /campaigns/1.json
  def destroy
    @campaign.destroy
    respond_to do |format|
      format.html { redirect_to campaigns_url, notice: 'Campaign was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_campaign
    @campaign = Campaign.includes(:campaign_pledges).find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def campaign_params
    params.require(:campaign).permit(:id, :title, :description, :start_at, :expired_at, :permalink, :campaign_pledges_attributes => [:id, :title, :description, :total_budget, :unit_budget], :images_attributes => [:id, :image])
  end
end
