class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true
  belongs_to :country
  belongs_to :state

  def state_text
    state.try(:abbr) || state.try(:name) || state_name
  end

  def same_as?(other)
    return false if other.nil?
    attributes.except('id', 'updated_at', 'created_at') == other.attributes.except('id', 'updated_at', 'created_at')
  end

  alias same_as same_as?

  def clone
    self.class.new(self.attributes.except('id', 'updated_at', 'created_at'))
  end

  def self.build_default
    country = Country.find_by_iso_name('CHINA') rescue Country.first
    new(country: country)
  end

  def self.default(user = nil)
    if user
      user.send(:'address') || build_default
    else
      build_default
    end
  end
end
