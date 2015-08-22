class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.decimal :amount
      t.integer :campaign_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
