class DocumentPolicy < ApplicationPolicy
  def create?
    user == record.user
  end

  def show?
    true
  end

  def permitted_attributes
    [:s3_key, :filename, :mime_type, :file_size]
  end

  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
end
