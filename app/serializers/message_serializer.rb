class MessageSerializer < ActiveModel::Serializer
  attributes :id, :beginning, :channel_id, :content, :sender, :timestamp, :user_id, :starred
  
  def starred
    instance_options[:starred_message_ids].include?(object.id)
  end
end
