class Commercial < ActiveRecord::Base
  include ActiveUUID::UUID
  after_initialize {self.uuid = SecureRandom.uuid if self.uuid.nil? }

  belongs_to :campaign_pledge
end
