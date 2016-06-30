class ChannelSerializer < ActiveModel::Serializer
  attributes :id, :name, :usernames, :type, :created_by, :topic, :purpose
end
