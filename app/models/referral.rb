class Referral < ActiveRecord::Base
    extend Dragonfly::Model
    include Rails.application.routes.url_helpers

    has_many :subordinates, class_name: 'Referral', foreign_key: 'parent_id'
    belongs_to :parent, class_name: 'Referral'
    include ActiveUUID::UUID
    include AASM
    after_initialize { self.uuid = SecureRandom.uuid if self.uuid.nil? }

    belongs_to :consumer
    belongs_to :referable, polymorphic: true

    def referral_url
        referable_path = eval("#{self.referable.class.name.downcase}_path(self.referable)")
        root_url.concat referable_path[1...referable_path.length].concat("?uuid=#{self.uuid}")
    end

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
