class MessagesChannel < ApplicationCable::Channel

  def subscribed
    if current_user && user_has_channel?
      stream_from "messages_#{params[:reslack_channel_id]}"
    end
  end
  
protected

  def channel_ids
    @channel_ids ||= current_user.channel_ids
  end
  
  def user_has_channel?
    channel_ids.include?(params[:reslack_channel_id].to_i)
  end

end
