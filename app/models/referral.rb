class Referral < ActiveRecord::Base
  include ActiveUUID::UUID
  after_initialize {self.uuid = self.create_uuid if self.uuid.nil? }

  belongs_to :consumer
end