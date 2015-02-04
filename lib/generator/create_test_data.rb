class Generator::CreateTestData
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
      Merchant.create!(
          :email => "user_#{i + start}@name.com",
          :password => 'password',
          :password_confirmation => 'password',
          :name => "merchant_test_#{i + start}"
      )
    end
  end
end