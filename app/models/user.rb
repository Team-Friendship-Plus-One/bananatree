class User < ActiveRecord::Base
  validates :first_name, :last_name, :location, :email, presence: true

  has_secure_password
  
  has_many :donations
  has_many :campaigns
end
