class User < ActiveRecord::Base
  validates :uid, :handle, :token, presence: true
end
