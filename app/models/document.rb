class Document < ActiveRecord::Base
  belongs_to :user
  validates :user,
            :filename,
            :file_size,
            :mime_type,
            :s3_bucket,
            presence: true
end
