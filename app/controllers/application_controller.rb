class ApplicationController < ActionController::API
  include Pundit
  before_action :allow_cross_origin_requests

  def preflight
    render nothing: true
  end

  private

  def allow_cross_origin_requests
    # TODO lock this down to the env['ORIGIN'] ?
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] =
      'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    headers['Access-Control-Max-Age'] = '1728000'
  end

  def current_user
    @current_user ||= user_from_token
  end

  def authenticate_user
    unless current_user
      render json: { message: 'authentication failed' }, status: 401
      return false
    end
  end

  def user_from_token
    return unless request.headers['Authorization']
    begin
      uid = JWT.decode(request.headers['Authorization'],
                       Rails.application.secrets.secret_key_base)[0]['uid']
      return User.find_by(uid: uid)

      # TODO
      # rescue JWT::DecodeError
      # handle expired tokens too?
    end
  end
end
