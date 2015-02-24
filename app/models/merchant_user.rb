class MerchantUser < ActiveRecord::Base
  include ActiveUUID::UUID
  after_initialize { self.uuid = SecureRandom.uuid if self.uuid.nil? }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :campaigns
  has_many :addresses, as: :addressable
end
