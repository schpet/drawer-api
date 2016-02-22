class TokensController < ApplicationController

  def request_token
    oauth = Oauth.create!
    redirect_to GITHUB.auth_code.authorize_url(state: oauth.state, redirect_uri: ENV.fetch('OAUTH_CALLBACK'), scope: "read:org")
  end

  def access_token
    oauth = Oauth.find_by(state: params[:state])
    code = params[:code]
    if oauth.present?
      token = GITHUB.auth_code.get_token(code, state: oauth.state, redirect_uri: ENV.fetch('OAUTH_CALLBACK'))

      # TODO handle github api http failures
      profile_response = token.get("https://api.github.com/user")
      profile = JSON.parse(profile_response.body)

      user = User.where(uid: profile["id"]).first_or_create do |u| 
        u.handle = profile["login"]
      end

      jwt = JWT.encode({ uid: user.uid, exp: 1.day.from_now.to_i }, 
                       Rails.application.secrets.secret_key_base)

      redirect_to ENV['ORIGIN'] + "?jwt=#{jwt}"
    else
      redirect_to ENV['ORIGIN']
    end
  end
end
