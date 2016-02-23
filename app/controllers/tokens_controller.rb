class TokensController < ApplicationController

  def request_token
    oauth = Oauth.create!
    redirect_to GITHUB.auth_code.authorize_url(state: oauth.state, redirect_uri: ENV.fetch('OAUTH_CALLBACK'), scope: "read:org")
  end

  def access_token
    oauth = Oauth.find_by(state: params.fetch(:state))
    return redirect_to ENV.fetch('ORIGIN') unless oauth

    token = GITHUB.auth_code.get_token(params.fetch(:code),
                                       state: oauth.state, 
                                       redirect_uri: ENV.fetch('OAUTH_CALLBACK'))

    # TODO handle github api http failures
    profile_response = token.get("https://api.github.com/user")
    profile = JSON.parse(profile_response.body)

    user_orgs = JSON.parse(token.get('https://api.github.com/user/orgs').body)
    user_org_names = user_orgs.map { |o| o.fetch("login") }

    # TODO handle failure better
    unless user_org_names.include?(ENV.fetch('GITHUB_ORG'))
      return redirect_to ENV.fetch('ORIGIN') + "?not_in_org"
    end

    # TODO hold onto their access token to query gh api at a later date?
    # figure out how omniauth does that

    user = User.where(uid: profile.fetch("id"), provider: "github").first_or_create do |u| 
      u.handle = profile.fetch("login")
      u.token = token.token
    end

    jwt = JWT.encode({ uid: user.uid, exp: 1.day.from_now.to_i }, 
                     Rails.application.secrets.secret_key_base)

    redirect_to ENV.fetch('ORIGIN') + "?jwt=#{jwt}"
  end
end
