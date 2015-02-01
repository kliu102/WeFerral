class Campaign < ActiveRecord::Base
  include ActiveUUID::UUID
  after_initialize {self.uuid = self.create_uuid if self.uuid.nil? }
end
