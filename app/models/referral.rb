class Referral < ActiveRecord::Base
    extend Dragonfly::Model
    include Rails.application.routes.url_helpers

    has_many :subordinates, class_name: 'Referral', foreign_key: 'parent_id'
    belongs_to :parent, class_name: 'Referral'
    include ActiveUUID::UUID
    include AASM
    after_initialize do
        self.uuid = SecureRandom.uuid if self.uuid.nil?
        self.relative_url = eval("#{self.referable.class.name.downcase}_path(self.referable)").concat("?uuid=#{self.uuid}") if self.relative_url.nil?
    end

    belongs_to :consumer
    belongs_to :referable, polymorphic: true

    def referral_url
        root_url[0...root_url.length - 1].concat self.relative_url
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
