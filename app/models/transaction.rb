class Transaction < ActiveRecord::Base
    include ActiveUUID::UUID
    after_initialize { self.uuid = SecureRandom.uuid if self.uuid.nil? }

    belongs_to :consumer
end
