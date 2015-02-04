class CampaignPledge < ActiveRecord::Base
  include ActiveUUID::UUID
  after_initialize {self.uuid = SecureRandom.uuid if self.uuid.nil? }

  belongs_to :campaign
  has_many :commercials
  has_many :referrals
end
