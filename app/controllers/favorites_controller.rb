class FavoritesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
  end

  def create
    @bean = Bean.find(params[:bean_id])
    favorite = current_user.favorites.new(bean_id: params[:bean_id])
    favorite.save
    #サーバーエラーが起きる原因と非同期通信ができない原因↓
    @bean.create_notification_favorite!(current_user)
  end

  def destroy
    @bean = Bean.find(params[:bean_id])
    favorite = current_user.favorites.find_by(bean_id: @bean.id)
    favorite.destroy
  end

end
