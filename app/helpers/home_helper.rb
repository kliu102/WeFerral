module HomeHelper
  def campaign_image(campaign)
    if campaign.present?
      image_path = campaign.master_image.try(:image_file_name)
      image_tag(root_url.concat image_path)
    else
      nil
    end
  end
end