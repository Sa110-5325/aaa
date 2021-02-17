class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @bean = Bean.find(params[:bean_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.bean_id = @bean.id
    @comment.save
    redirect_to bean_path(@bean)
  end

  def destroy
    @bean = Bean.find(params[:bean_id])
    @comment = Comment.find_by(id: params[:id], bean_id: params[:bean_id])
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
