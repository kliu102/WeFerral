module HomeHelper
  def campaign_photo(campaign)
    if campaign.present?
      campaign.master_photo
    else
      nil
    end
  end
end