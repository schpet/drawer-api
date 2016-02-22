# original
#
# GITHUB = OAuth::Consumer.new(
#   Rails.application.secrets.github_consumer_key,
#   Rails.application.secrets.github_consumer_secret,
#   authorize_path: '/oauth/authenticate',
#   site: 'https://github.com/login/oauth/authorize'
# )


# edited
#
# GITHUB = OAuth::Consumer.new(
#   Rails.application.secrets.github_consumer_key,
#   Rails.application.secrets.github_consumer_secret,
#   authorize_path: '/login/oauth/authorize',
#   access_token_path: '/login/oauth/access_token',
#   site: 'https://github.com'
# )

# oauth2:
#
GITHUB = OAuth2::Client.new(
  Rails.application.secrets.github_consumer_key, 
  Rails.application.secrets.github_consumer_secret,
  {
    :site          => 'http://github.com',
    :authorize_url => 'login/oauth/authorize',
    :token_url     => 'login/oauth/access_token'
    # :ssl           => { :verify => false }
  }
)
