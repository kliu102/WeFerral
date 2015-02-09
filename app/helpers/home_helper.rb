module HomeHelper
  def campaign_image(campaign)
    if campaign.present?
      image_path = campaign.master_image.image_file_name rescue 'images/master_image.jpg'
      image_tag(root_url.concat image_path)
    else
      nil
    end
  end

  def campaign_image_path(campaign)
    if campaign.present?
      image_path = campaign.master_image.image_file_name rescue 'images/master_image.jpg'
      root_url.concat image_path
    else
      nil
    end
  end
end