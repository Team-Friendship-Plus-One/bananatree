class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :title
      t.date :deadline_date
      t.decimal :goal
      t.boolean :funded
      t.decimal :current_total
      t.string :location

      t.timestamps null: false
    end
  end
end
