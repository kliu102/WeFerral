class CampaignPledge < ActiveRecord::Base
  include ActiveUUID::UUID
  after_initialize {self.uuid = SecureRandom.uuid if self.uuid.nil? }

  attr_accessor :referral_uuid

  belongs_to :campaign
  has_many :referrals, as: :referable
  has_many :photos

  has_one :master_photo, -> { where is_master: true },
          inverse_of: :campaign_pledge,
          class_name: 'Photo',
          foreign_key: :campaign_pledge_id

  scope :active, -> { where(status: 'launched') }
end
