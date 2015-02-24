class UserAction < ActiveRecord::Base
  include ActiveUUID::UUID
  include AASM
  after_initialize { self.uuid = SecureRandom.uuid if self.uuid.nil? }

end
