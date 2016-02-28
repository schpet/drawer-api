class DocumentPolicy < ApplicationPolicy
  def create?
    user == record.user
  end

  def permitted_attributes
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
