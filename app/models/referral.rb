class Referral < ActiveRecord::Base
  include ActiveUUID::UUID
  include AASM
  after_initialize {self.uuid = self.create_uuid if self.uuid.nil? }

  belongs_to :consumer
  dragonfly_accessor :qr_code

  aasm :column => :status do
    state :new, :initial => true
    state :pending
    state :accomplished
    state :cancelled

    event :pend do
      transitions :from => :new, :to => :pending
    end

    event :accomplish do
      transitions :from => :pending, :to => :accomplished
    end

    event :cancel do
      transitions :from => [:new, :pending], :to => :cancelled
    end
  end
end
