class RemoveSecretFromOauths < ActiveRecord::Migration[5.0]
  def change
    remove_column :oauths, :secret
  end
end
