class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.uuid :user_id, null: false, index: true
      t.text :filename, null: false

      t.timestamps
    end

    add_foreign_key :documents, :users

  end
end
