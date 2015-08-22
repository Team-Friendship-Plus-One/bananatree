class Campaign < ActiveRecord::Base
  validates :title, :deadline_date, :goal, presence: true

  has_many :donations
  has_many :campaign_clients
  has_many :clients, :through => :campaign_clients
end
