class ToDoListsController < ApplicationController
  before_action :set_to_do_list, only: [:show, :destroy]

  def show
    authorize @to_do_list
    #@to_dos = ToDo.where(to_do_id: @to_do.id)
    @to_dos = ToDo.all
    @to_do = ToDo.new
  end

  def create
    @to_do_list = ToDoList.new(to_do_list_params)
    @to_do_list.user = current_user
    campaign_id = params[:campaign_id].to_i
    @to_do_list.campaign = Campaign.find(campaign_id)
    authorize @to_do_list
    if @to_do_list.save
    # redirect_to to_do_list_path(@to_do_list)
      redirect_to campaign_path(@to_do_list.campaign)
    else
      render "new"
    end
  end

  def destroy
    @to_do_list.destroy
  end


  private

  def set_to_do_list
    @to_do_list = ToDoList.find(params[:id])
  end

  def to_do_list_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    params.require(:to_do_list).permit(:listname)
  end

end
