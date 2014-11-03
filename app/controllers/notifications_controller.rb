class NotificationsController < ApplicationController

  def destroy
   notification_array = Notification.where(user_id:current_user.id)
   notification_array.map do |notification|
    notification.update_attribute(:status, false)
    end
   render :nothing => true
  end
end
