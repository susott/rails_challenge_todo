class CampaignPolicy < ApplicationPolicy
   attr_reader :user, :campaign

  def initialize(user, campaign)
    @user = user
    @campaign = campaign
  end

  # def new?
  #   true
  # end

  def create?
    @user.expert
  end

  def destroy?
    @user.expert
  end

  class Scope < Scope
    def resolve
      # scope.all
      scope
    end
  end
end
