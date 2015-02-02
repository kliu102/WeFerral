json.array!(@referrals) do |referral|
  json.extract! referral, :id
  json.url referral_url(referral, format: :json)
end
