class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    enable_extension "uuid-ossp"
    create_table :users, id: :uuid do |t|
      t.text :uid, null: false, index: true
      t.text :handle, null: false, index: true

      t.timestamps
    end
  end
end
