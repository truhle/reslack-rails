class MessageSerializer < ActiveModel::Serializer
  attributes :id, :beginning, :content, :sender, :timestamp
  has_one :user
  has_one :channel
end
