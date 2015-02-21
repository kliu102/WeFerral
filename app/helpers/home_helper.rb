module HomeHelper
    def campaign_image(campaign)
        tag('img', src: campaign_image_path(campaign))
    end

    def campaign_image_path(campaign)
        "/#{campaign.master_image.image.path}" if campaign.present?
    end
end