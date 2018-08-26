class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :destroy]

  def index
    @comments = Comment.all
    authorize @comments
  end

  def new
    @comment = Comment.new
    authorize @comment
  end

  def show
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    if params.key?("campaign_id")
      campaign = Campaign.find_by_id(params[:campaign_id])
      @comment.campaign = campaign
      authorize @comment
      if @comment.save
        redirect_to campaign_path(@comment.campaign)
      else
        render "new"
      end
    else
      todo = ToDo.find_by_id(params[:comment_id])
      @comment.todo = todo
      authorize @comment
      if @comment.save
        redirect_to campaign_path(@comment.campaign)
      else
        render "new"
      end
    end
  end

  def destroy
    @comment.destroy
  end


  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    params.require(:comment).permit(:title, :campaign_id)
  end
end
