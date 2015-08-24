class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.string :location
      t.text :special_notes
      t.integer :age
      t.string :gender
      t.string :picture
      t.string :goals
      t.integer :campaign_id

      t.timestamps null: false
    end
  end
end
