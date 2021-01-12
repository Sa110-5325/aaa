class ShopsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @shops = Shop.all
    @shop = Shop.new
  end

  def show
    @shop = Shop.find(params[:id])
    @comment = Comment.new
  end

  def new
    @shop = Shop.new
  end

  def edit
    @shop = Shop.find(params[:id])
    if @shop.user != current_user
      redirect_to shops_path, alert: '不正なアクセスです。'
    end
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.user_id = current_user.id
    if @shop.save
      redirect_to shop_path(@shop), notice: '投稿に成功しました。'
    else
      render :new
    end
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      redirect_to shop_path(@shop), notice: '更新に成功しました。'
    else
      render :edit
    end
  end

  def destroy
    shop = Shop.find(params[:id])
    shop.destroy
    redirect_to shops_path
  end

  private
  def shop_params
    params.require(:shop).permit(:title, :body, :image)
  end
end
