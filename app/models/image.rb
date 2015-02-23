class Image < ActiveRecord::Base
    has_attached_file :image, :styles => {:medium => "300x300>", :thumb => "100x100>"}, :default_url => "/images/:style/missing.png"
    validates_attachment :image,
                         :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
                         :presence => true,
                         :size => { :in => 0..2.megabytes }
    belongs_to :campaign
end
