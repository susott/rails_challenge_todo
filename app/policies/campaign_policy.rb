class CampaignPolicy < ApplicationPolicy

  # def new?
  #   true
  # end

  def create?
    current_user.expert
  end

  def destroy?
    current_user.expert
  end

  class Scope < Scope
    def resolve
      # scope.all
      scope
    end
  end
end
