class Donation < ActiveRecord::Base
  validates :amount, presence: true

  belongs_to :campaign
  belongs_to :user
end
