class RemoveTokenFromOauths < ActiveRecord::Migration[5.0]
  def change
    remove_column :oauths, :token, :text
  end
end
