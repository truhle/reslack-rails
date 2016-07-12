class ChannelSerializer < ActiveModel::Serializer
  
  attributes :id, :name, :usernames, :channel_type, :created_by, :topic, :purpose, :private, :starred
  
  def starred
    instance_options[:starred_channel_ids].include?(object.id)
  end
  
  def usernames
    if object.channel_type == "direct"
      object.users.pluck(:username)
    else
      []
    end
  end
end
