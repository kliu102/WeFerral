class Merchant < ActiveRecord::Base
  include ActiveUUID::UUID
  after_initialize {self.uuid = self.create_uuid if self.uuid.nil? }
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
