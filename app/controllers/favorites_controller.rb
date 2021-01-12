class FavoritesController < ApplicationController
  
  def create
    @shop = Shop.find(params[:shop_id])
    @favorite = current_user.favorites.create(shop_id: params[:shop_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    @faverite = current_user.favorites.find_by(shop_id: @shop.id)
    @faverite.destroy
    redirect_back(fallback_location: root_path)
  end
end
