GITHUB = OAuth::Consumer.new(
  Rails.application.secrets.github_consumer_key,
  Rails.application.secrets.github_consumer_secret,
  authorize_path: '/oauth/authenticate',
  site: 'https://github.com/login/oauth/authorize'
)
