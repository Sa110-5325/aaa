class UsersController < ApplicationController
  before_action :check_guest, only: %i[update destroy]
  before_action :ensure_current_user, only: [:edit]

  def index
    @user = User.find(params[:user_id])
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render "show"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :profile_image)
  end

  def ensure_current_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

  def check_guest
    email = current_user.email || params[:user][:email].downcase
    if email == 'guest@example.com'
      redirect_to user_path(current_user)
    end
  end
end
