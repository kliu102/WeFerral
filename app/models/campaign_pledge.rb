class CampaignPledge < ActiveRecord::Base
  include ActiveUUID::UUID
  after_initialize { self.uuid = SecureRandom.uuid if self.uuid.nil? }

  attr_accessor :referral_uuid

  belongs_to :campaign
  has_many :referrals, as: :referable

  scope :active, -> { where(status: 'launched') }
end
