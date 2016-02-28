class DocumentSerializer < ActiveModel::Serializer
  attributes :id,
             :file_size,
             :mime_type,
             :filename,
             :url

  # TODO cloudfront?
  def url
    "https://#{object.s3_bucket}.s3.amazonaws.com/#{object.s3_key}"
  end
end
