module ReferralsHelper
  def validate_referral_uuid(referral_uuid)
    Referral.find_by_uuid(referral_uuid) ? referral_uuid : nil
  end
end
