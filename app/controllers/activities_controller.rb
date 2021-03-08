class ActivitiesController < ApplicationController

  def index
    @activities = current_user.active_notifications.page(params[:page]).per(10)
    # @user = User.all
    # @comment = current_user.comments.all
    # @favorite = current_user.favorites.all
    # @follow = current_user.followers.all
  end

  # def read
  #   activity = current_user.activities.find(params[:id])
  #   activity.read! if activity.unread?
  #   redirect_to activity.transition_path
  # end
end
