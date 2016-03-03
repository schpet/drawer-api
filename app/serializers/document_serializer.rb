class DocumentSerializer < ActiveModel::Serializer
  attributes :id,
             :file_size,
             :mime_type,
             :filename,
             :url

  def url
    if ENV['S3_CDN'].present? && object.s3_bucket == ENV['S3_BUCKET']
      return "#{ENV['S3_CDN']}/#{object.s3_key}"
    end

    "https://#{object.s3_bucket}.s3.amazonaws.com/#{object.s3_key}"
  end
end
