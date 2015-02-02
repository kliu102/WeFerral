class CampaignPledge < ActiveRecord::Base
  include ActiveUUID::UUID
  after_initialize {self.uuid = self.create_uuid if self.uuid.nil? }

  belongs_to :campaign
  has_many :commercials, :referrals
end
