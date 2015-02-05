class Referral < ActiveRecord::Base
  extend Dragonfly::Model

  has_many :subordinates, class_name: 'Referral', foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'Referral'
  include ActiveUUID::UUID
  include AASM
  after_initialize {self.uuid = SecureRandom.uuid if self.uuid.nil? }

  belongs_to :consumer
  belongs_to :referable, polymorphic: true
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
