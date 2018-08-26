class ToDoPolicy < ApplicationPolicy
  def create?
    true
  end

  def destroy?
    current_user.expert
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
