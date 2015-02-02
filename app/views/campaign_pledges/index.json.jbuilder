json.array!(@campaign_pledges) do |campaign_pledge|
  json.extract! campaign_pledge, :id
  json.url campaign_pledge_url(campaign_pledge, format: :json)
end
