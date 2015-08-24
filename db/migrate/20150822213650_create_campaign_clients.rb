class CreateCampaignClients < ActiveRecord::Migration
  def change
    create_table :campaign_clients do |t|
      t.references :campaign, index: true, foreign_key: true
      t.references :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
