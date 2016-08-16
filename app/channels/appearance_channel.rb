class AppearanceChannel < ApplicationCable::Channel
  
  def subscribed
    stream_from "appearance_#{params[:group_id]}"
    appear
  end
  
  def unsubscribed
    disappear
  end
  
  def appear
    current_user.appear(params[:group_id])
  end
  
  def disappear
    current_user.disappear(params[:group_id])
  end
  
end
