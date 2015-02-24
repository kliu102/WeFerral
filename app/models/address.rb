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
end
