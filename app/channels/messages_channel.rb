class MessagesChannel < ApplicationCable::Channel

  def subscribed
    stream_from "messages_#{params[:reslack_channel_id]}"
  end

end
