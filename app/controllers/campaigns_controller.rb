class CampaignsController < ApplicationController
    before_action :set_campaign, only: [:show, :destroy]

  def index
    @campaigns = Campaign.all
    authorize @campaigns
  end

  def new
    @campaign = Campaign.new
    authorize @campaign
  end

  def show
    authorize @campaign
    @to_do_lists = ToDoList.where(campaign_id: @campaign.id)
    @comment = Comment.new
    authorize @comment
    @comments = Comment.where(campaign_id: @campaign.id)
    @to_do_list = ToDoList.new
    authorize @to_do_list
  end

  def create
    # @params.tags = @params.tags.split(", ")
    #@campaign = Campaign.new(params[:campaign])
    @campaign = Campaign.new(campaign_params)
    @campaign.user = current_user
    authorize @campaign
    if @campaign.save
    # redirect_to campaign_path(@campaign)
    redirect_to dashboard_path
    else
      render "new"
    end
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
