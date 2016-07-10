class ChannelSerializer < ActiveModel::Serializer
  attributes :id, :name, :usernames, :channel_type, :created_by, :topic, :purpose, :starred
  
  def starred
    object.id.even? ? true : false
  end
  
  def usernames
    if object.channel_type == "direct"
      object.users.pluck(:username)
    else
      []
    end
  end
end
