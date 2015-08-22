class User < ActiveRecord::Base
  validates :first_name, :last_name, :location, :email, presence: true
  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  has_secure_password
  
  has_many :donations
  has_many :campaigns
end
