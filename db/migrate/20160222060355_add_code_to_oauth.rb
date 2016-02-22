class AddCodeToOauth < ActiveRecord::Migration[5.0]
  def change
    add_column :oauths, :state, :text, null: false
  end
end
