class AddTimezoneToCity < ActiveRecord::Migration
  def change
    add_column :cities, :timezone, :string
  end
end
