class Campaign < ActiveRecord::Base
    include ActiveUUID::UUID
    after_initialize { self.uuid = SecureRandom.uuid if self.uuid.nil? }

    attr_accessor :referral_uuid

    belongs_to :merchant, dependent: :destroy
    has_many :campaign_pledges
    has_many :referrals, as: :referable
    has_one :master_pledge, -> { where is_master: true },
            inverse_of: :campaign,
            class_name: 'CampaignPledge',
            foreign_key: :campaign_id

    scope :active, -> { where(status: 'launched') }
    delegate :master_image, to: :master_pledge

    cattr_accessor :search_scopes do
        []
    end

    def self.add_search_scope(name, &block)
        self.singleton_class.send(:define_method, name.to_sym, &block)
        search_scopes << name.to_sym
    end

    def self.like_any(fields, values)
        where fields.map { |field|
                  values.map { |value|
                      arel_table[field].matches("%#{value}%")
                  }.inject(:or)
              }.inject(:or)
    end

    add_search_scope :in_taxon do |taxon|
        includes(:classifications).
                where("campaigns_taxons.taxon_id" => taxon.self_and_descendants.pluck(:id)).
                order("campaigns_taxons.position ASC")
    end

    def lowest_award
        self.campaign_pledges.map(&:unit_budge).min rescue nil
    end
end
