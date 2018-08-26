class ToDosController < ApplicationController
  before_action :set_to_do, only: [:destroy]
  def new
    @to_do = ToDo.new
    authorize @to_do
  end

  def create
    @to_do = ToDo.new(to_do_params)
    authorize @to_do
    @to_do_list = ToDoList.find(params[:to_do_list_id].to_i)
    @to_do.to_do_list = @to_do_list
    @to_do.user = current_user
    if @to_do.save
      redirect_to to_do_list_path(@to_do.to_do_list)
    else
      render "new" # or better raise an error?
    end
  end

  def destroy
    @to_do.destroy
  end

  private

  def set_to_do
    @to_do = ToDo.find(params[:id])
  end

  def to_do_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    params.require(:to_do).permit(:name, :description)
  end
end
