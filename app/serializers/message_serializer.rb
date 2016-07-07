class MessageSerializer < ActiveModel::Serializer
  attributes :id, :beginning, :channel_id, :content, :sender, :timestamp, :user_id
end
