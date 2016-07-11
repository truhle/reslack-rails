class MessageSerializer < ActiveModel::Serializer
  attributes :id, :beginning, :channel_id, :content, :sender, :timestamp, :user_id, :starred
  
  def starred
    instance_options[:user].message_starred?(object.id)
  end
end
