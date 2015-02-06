class Campaign < ActiveRecord::Base
  include ActiveUUID::UUID
  after_initialize {self.uuid = SecureRandom.uuid if self.uuid.nil? }

  attr_accessor :referral_uuid

  belongs_to :merchant
  has_many :campaign_pledges
  has_many :referrals, as: :referable

  scope :active, -> { where(status: 'launched') }
end
