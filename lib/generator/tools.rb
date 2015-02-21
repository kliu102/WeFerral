class Generator::Tools
    include Rails.application.routes.url_helpers

    def self.create_merchants(n)
        start = MerchantUser.count
        n.times do |i|
            m = create_merchant(i + start)
            create_campaign(m)
        end
    end

    def self.create_merchant(i)
        MerchantUser.create!(
                :email => "user#{i}@gmail.com",
                :password => 'password',
                :password_confirmation => 'password',
                :name => "merchant_#{i}"
        )
    end

    def self.create_campaign(merchant)
        start = merchant.campaigns.size
        campaign = Campaign.new(
                permalink: "permalink_#{merchant.name}_#{start}",
                start_at: Time.now,
                expired_at: Time.now + 7.days,
                title: 'awesome campaign',
                description: 'Logs an impression... and I use that term loosely. It can log page impressions (technically action impressions), but it is not limited to that. You can log impressions multiple times per request. And you can also attach it to a model. The goal of this project is to provide customizable stats that are immediately accessible in your application as opposed to using Google Analytics and pulling data using their API. You can attach custom messages to impressions. No reporting yet.. this thingy just creates the data.',
                status: 'launched'
        )
        create_campaign_pledges(campaign)
        merchant.campaigns << campaign
    end

    def self.create_campaign_pledges(campaign)
        2.times do |i|
            campaign_pledge = CampaignPledge.new(
                    total_budget: 10000,
                    unit_budget: 10,
                    title: 'awesome campaign pledge',
                    description: 'Logs an impression... and I use that term loosely. It can log page impressions (technically action impressions), but it is not limited to that. You can log impressions multiple times per request. And you can also attach it to a model. The goal of this project is to provide customizable stats that are immediately accessible in your application as opposed to using Google Analytics and pulling data using their API. You can attach custom messages to impressions. No reporting yet.. this thingy just creates the data.',
                    status: 'launched'
            )
            create_campaign_pledge_images(campaign_pledge)
            campaign.campaign_pledges << campaign_pledge
        end
        campaign.campaign_pledges.first.update_attributes(:is_master => true)
    end

    def self.create_campaign_pledge_images(campaign_pledge)
        campaign_pledge.images << Image.new(image: File.open("./public/images/samples/#{rand(11) + 1}.jpg"), is_master: true)
        campaign_pledge.images << Image.new(image: File.open("./public/images/samples/#{rand(11) + 1}.jpg"))
    end

    def self.create_user(i)
        User.create!(
                :email => "user_#{i}@name.com",
                :password => 'password',
                :password_confirmation => 'password',
        )
    end

    def self.create_users(n)
        start = User.count
        n.times do |i|
            create_user(i + start)
        end
    end
end