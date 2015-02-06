class Campaign < ActiveRecord::Base
  include ActiveUUID::UUID
  after_initialize {self.uuid = SecureRandom.uuid if self.uuid.nil? }

  attr_accessor :referral_uuid

  belongs_to :merchant
  has_many :campaign_pledges
  has_many :referrals, as: :referable
  has_one :master, -> { where is_master: true },
          inverse_of: :campaign,
          class_name: 'CampaignPledge',
          foreign_key: :campaign_id,
          dependent: :destroy

  scope :active, -> { where(status: 'launched') }

  def self.like_any(fields, values)
    where fields.map { |field|
            values.map { |value|
              arel_table[field].matches("%#{value}%")
            }.inject(:or)
          }.inject(:or)
  end
end
