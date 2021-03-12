class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    # @comment = @bean.comments.new(comment_params)
    # if @comment.save
    #   @bean.create_notification_comment!(current_user, @comment.id)
    #   @comment = Comment.new
    # end
    @bean = Bean.find(params[:bean_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.bean_id = @bean.id
    if @comment.save
      #サーバーエラーの原因と非同期通信ができない↓
      @bean.create_notification_comment!(current_user, @comment.id)
    else
      render 'beans/show'
    end
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
