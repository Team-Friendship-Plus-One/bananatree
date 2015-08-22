class Client < ActiveRecord::Base
  has_many :campaigns, :through => :campaign_client
end
