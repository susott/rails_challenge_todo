class CampaignsController < ApplicationController
    before_action :set_campaign, only: [:show, :destroy]

  def index
    @campaigns = Campaign.all
  end

  def show
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(params[:campaign])
    @campaign.save
    redirect_to campaign_path(@campaign)
  end

  def destroy
    @campaign.destroy
  end

  private

  def set_campaign
    @campaign = Campaign.find(params[:id])
  end

  def campaign_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    params.require(:campaign).permit(:title, :tags, :duration)
  end
end
