class Client < ActiveRecord::Base
  validates :first_name, :last_name, :location, :bio, :age, :gender, presence: true

  has_many :campaign_clients
  has_many :campaigns, :through => :campaign_clients
end
