class User < ActiveRecord::Base
  validates :uid, :handle, :provider, :token, presence: true
end
