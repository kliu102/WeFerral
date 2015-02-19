module HomeHelper
    def campaign_image(campaign)
        if campaign.present?
            image_path = campaign.master_image.image_file_name rescue "samples/#{rand(11) + 1}.jpg"
            image_tag(image_path)
        else
            nil
        end
    end

    def campaign_image_path(campaign)
        if campaign.present?
            image_path = campaign.master_image.image_file_name rescue "images/samples/#{rand(11) + 1}.jpg"
            path_to_image image_path
        else
            nil
        end
    end
end