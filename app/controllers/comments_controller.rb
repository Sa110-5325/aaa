class CommentsController < ApplicationController
  def create
    @bean = Bean.find(params[:bean_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.bean_id = @bean.id
    @comment.save
    redirect_to bean_path(@bean)
  end

  def destroy
    Comment.find_by(id: params[:id], bean_id: params[:bean_id]).destroy
    redirect_to bean_path(params[:bean_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
