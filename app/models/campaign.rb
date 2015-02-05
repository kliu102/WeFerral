class Campaign < ActiveRecord::Base
  include ActiveUUID::UUID
  after_initialize {self.uuid = SecureRandom.uuid if self.uuid.nil? }

  belongs_to :merchant
  has_many :campaign_pledges
  has_many :referrals, as: :referable
end
