class User < ActiveRecord::Base
  include ActiveUUID::UUID
  after_initialize { self.uuid = SecureRandom.uuid if self.uuid.nil? }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :referrals
  has_many :transactions
  has_one :address, as: :addressable
  accepts_nested_attributes_for :address, :allow_destroy => true
end
