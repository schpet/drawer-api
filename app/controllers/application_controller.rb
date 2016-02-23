class ApplicationController < ActionController::API
  before_action :allow_cross_origin_requests, if: -> { Rails.env.development? }

  def preflight
    render nothing: true
  end

  private

  def allow_cross_origin_requests
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    headers['Access-Control-Max-Age'] = '1728000'
  end

  def current_user
    @current_user ||= get_user_from_token
  end

  def authenticate_user
    unless current_user
      render json: { message: 'authentication failed' }, status: 401 
      return false
    end
  end

  def get_user_from_token
    return unless request.headers['Authorization']
    begin
      uid = JWT.decode(request.headers['Authorization'], Rails.application.secrets.secret_key_base)[0]['uid']
      return User.find_by(uid: uid)
    # rescue JWT::DecodeError
    end
  end
end
