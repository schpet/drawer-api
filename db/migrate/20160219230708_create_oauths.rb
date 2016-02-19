class CreateOauths < ActiveRecord::Migration[5.0]
  def change
    create_table :oauths do |t|
      t.text :token, null: false, index: true
      t.text :secret, null: false

      t.timestamps
    end
  end
end
