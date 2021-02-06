class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user, only: [:index, :show, :edit]

  def index
    @beans = Bean.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @user.id = current_user.id
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

  def ensure_current_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
