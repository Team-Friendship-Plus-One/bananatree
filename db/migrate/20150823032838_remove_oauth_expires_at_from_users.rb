class RemoveOauthExpiresAtFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :oauth_expires_at, :time
  end
end
