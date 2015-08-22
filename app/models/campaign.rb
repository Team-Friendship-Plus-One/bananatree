class Campaign < ActiveRecord::Base
  has_many :donations
  has_many :clients, :through => :campaign_client
end
