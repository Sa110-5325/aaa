class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create]

  def create
    @comment = Comment.new(comment_params)
    @comment = current_user.comments.create(shop_id: params[:shop_id])
    redirect_to shop_path(shop)
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    @comment = current_user.comments.find_by(shop_id: @shop.id)
    @comment.destroy
    redirect_to shop_path(shop)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end

end
