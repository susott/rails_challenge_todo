class UserPolicy < ApplicationPolicy
def index?
    @user.expert
  end

  def show?
    @user.expert
  end

  def create?
    @user.expert
  end

  def new?
    @user.expert
  end

  def update?
    @user.expert
  end

  def edit?
    @user.expert
  end

  def destroy?
    @user.expert
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
