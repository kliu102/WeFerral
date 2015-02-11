module ReferralsHelper
    def validate_referral_uuid(referral_uuid)
        if referral_uuid.present? && Referral.find_by_uuid(referral_uuid)
            referral_uuid
        else
            nil
        end
    end
end
