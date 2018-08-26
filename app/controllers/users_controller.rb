class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
    authorize @users
  end

  def show
    authorize @user
  end

  def new
    @user = User.new
    authorize @user
  end

  def create
    @user = User.new(user_params)
    authorize @user
    if @user.save
    redirect_to user_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    @user.update(user_params)
    authorize @user
    redirect_to user_path
  end

  def delete
    @user.destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    params.require(:user).permit(:username, :email, :status, :profession, :service, :password, :expert)
  end
end
