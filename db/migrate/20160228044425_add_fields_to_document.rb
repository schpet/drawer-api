class AddFieldsToDocument < ActiveRecord::Migration[5.0]
  def change
    add_column :documents, :mime_type, :string, null: false
    add_column :documents, :file_size, :integer, null: false
    add_column :documents, :s3_key, :text, null: false
    add_column :documents, :s3_bucket, :string, null: false
  end
end
