class Merchant < ActiveRecord::Base
  after_initialize :create_unique_identifier
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def create_unique_identifier
    self.uuid = SecureRandom.uuid if self.uuid.nil?
  end
end
