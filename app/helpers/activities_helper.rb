module ActivitiesHelper
  def unchecked_activities
    @activities = current_user.active_notifications.where(checked: false)
  end
  
end
