class AddProviderAndTokenToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :provider, :string, null: false
    add_column :users, :token, :string, null: false
  end
end
