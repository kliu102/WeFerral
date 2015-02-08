class Generator::Tools
  # def self.create_campaigns(number)
  #   deal = Heron::Deal.new
  #   number = number.to_s
  #   deal.title = "test " + number
  #   deal.permalink = "permalink " + number
  #   location = Heron::Location.new
  #   addr_geo = GeoTools::AddressGeoTool.do_geocode('20906')
  #   if addr_geo[:success]
  #     location.lat = addr_geo[:lat]
  #     location.lng = addr_geo[:lng]
  #   end
  #   deal.locations << location
  #   option = Heron::Option.new
  #   option.option_title = "option title " + number
  #   option.unit_price = rand(124)
  #   deal.options << option
  #   deal.save!
  # end
  #
  # def self.create_deals(numbers)
  #   for i in (1..100)
  #     create_deal(i)
  #   end
  # end

  def self.create_merchants(n)
    start = Merchant.count
    n.times do |i|
      m = create_merchant(i + start)
      create_campaign(m)
    end
  end

  def self.create_merchant(i)
    Merchant.create!(
        :email => "user_#{i}@name.com",
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
        description: 'What an awesome campaign, Come on!',
        status: 'launched'
    )
    create_campaign_pledges(campaign)
    merchant.campaigns << campaign
  end

  def self.create_campaign_pledges(campaign)
    2.times do |i|
      campaign_pledge = CampaignPledge.new(
          permalink: "#{campaign.permalink}_#{i}",
          start_at: Time.now,
          expired_at: Time.now + 7.days,
          total_budge: 10000,
          unit_budge: 10,
          title: 'awesome campaign pledge',
          description: 'What an awesome campaign pledge, Come on!',
          status: 'launched'
      )
      create_campaign_pledge_images(campaign_pledge)
      campaign.campaign_pledges << campaign_pledge
    end
    campaign.campaign_pledges.first.update_attributes(:is_master => true)
  end

  def self.create_campaign_pledge_images(campaign_pledge)
    campaign_pledge.images << Image.new(:image_file_name => 'images/master_image.jpg', :is_master => true)
    campaign_pledge.images << Image.new(:image_file_name => 'images/non_master_image.jpg')
  end

  def self.create_consumer(i)
    Consumer.create!(
        :email => "user_#{i}@name.com",
        :password => 'password',
        :password_confirmation => 'password',
    )
  end

  def self.create_consumers(n)
    start = Consumer.count
    n.times do |i|
      create_consumer(i + start)
    end
  end
end