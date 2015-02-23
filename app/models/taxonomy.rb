class Taxonomy < ActiveRecord::Base
    has_many :children, class_name: 'Taxonomy', foreign_key: 'parent_id'
    belongs_to :parent, class_name: 'Taxonomy'
end
