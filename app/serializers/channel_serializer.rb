class ChannelSerializer < ActiveModel::Serializer
  
  attributes :id, :name, :usernames, :channel_type, :created_by, :topic, :purpose, :private, :starred
  
  # @user_channel_stars = instance_options[:user].user_channel_stars.by_channel(object.id)
  def current_user
    instance_options[:user]
  end
  
  def starred
    current_user.channel_starred?(object.id)
  end
  
  def usernames
    if object.channel_type == "direct"
      object.users.pluck(:username)
    else
      []
    end
  end
end
