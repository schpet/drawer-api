# some env vars you want:
# AWS_ACCESS_KEY_ID
# AWS_SECRET_ACCESS_KEY
# S3_BUCKET
# AWS_REGION
S3_BUCKET = Aws::S3::Resource.new.bucket(ENV['S3_BUCKET'])
