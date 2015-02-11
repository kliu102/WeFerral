class CampaignPledgesController < ApplicationController
    include ReferralsHelper
    before_action :set_campaign_pledge, only: [:show, :edit, :update, :destroy]

    # GET /campaign_pledges
    # GET /campaign_pledges.json
    def index
        @campaign_pledges = CampaignPledge.all
    end

    # GET /campaign_pledges/1
    # GET /campaign_pledges/1.json
    def show
        @referral_uuid = validate_referral_uuid(params[:referral_uuid])
        puts campaign_pledge_url

    end

    # GET /campaign_pledges/new
    def new
        @campaign_pledge = CampaignPledge.new
    end

    # GET /campaign_pledges/1/edit
    def edit
    end

    # POST /campaign_pledges
    # POST /campaign_pledges.json
    def create
        @campaign_pledge = CampaignPledge.new(campaign_pledge_params)

        respond_to do |format|
            if @campaign_pledge.save
                format.html { redirect_to @campaign_pledge, notice: 'Campaign pledge was successfully created.' }
                format.json { render :show, status: :created, location: @campaign_pledge }
            else
                format.html { render :new }
                format.json { render json: @campaign_pledge.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /campaign_pledges/1
    # PATCH/PUT /campaign_pledges/1.json
    def update
        respond_to do |format|
            if @campaign_pledge.update(campaign_pledge_params)
                format.html { redirect_to @campaign_pledge, notice: 'Campaign pledge was successfully updated.' }
                format.json { render :show, status: :ok, location: @campaign_pledge }
            else
                format.html { render :edit }
                format.json { render json: @campaign_pledge.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /campaign_pledges/1
    # DELETE /campaign_pledges/1.json
    def destroy
        @campaign_pledge.destroy
        respond_to do |format|
            format.html { redirect_to campaign_pledges_url, notice: 'Campaign pledge was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign_pledge
        @campaign_pledge = CampaignPledge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def campaign_pledge_params
        params[:campaign_pledge]
    end
end
