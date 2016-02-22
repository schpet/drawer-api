class Oauth < ActiveRecord::Base
  has_secure_token :state
end
