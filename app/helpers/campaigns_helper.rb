module CampaignsHelper
    def cache_key_for_campaigns
        count = @campaigns.count
        max_updated_at = (@campaigns.maximum(:updated_at) || Date.today).to_s(:number)
        "#{current_locale}campaigns/all-#{params[:page]}-#{max_updated_at}-#{count}"
    end
end
