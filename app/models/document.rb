class Document < ActiveRecord::Base
  belongs_to :user
  validates :user, :filename, presence: true
end
