class AddMoreDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :name, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :location, :string
    add_column :users, :phone, :string
    add_column :users, :signed_through_twitter, :boolean
  end
end
