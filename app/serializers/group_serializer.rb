class GroupSerializer < ActiveModel::Serializer
  attributes :group_id, :group_name, :group_prefix, :current_user,  :messages
  
  has_many :users do |serializer|
    group = serializer.object
    group_presences = group.user_group_presences.pluck(:user_id, :presence)
    group.users.map do |user|
      if group_presences.include?([user.id, true])
        user.present = true
      else
        user.present = false
      end
      user
    end
  end
  
  has_many :channels, key: :all_channels do |serializer|
    serializer.current_user.channels.by_group(serializer.group_id)
  end
  
  has_many :messages do |serializer|
    serializer.current_user.channels.by_group(serializer.group_id)
      .reduce([]) do |ary, channel|
        ary.concat(channel.messages.last_85)
      end
  end
  
  def group_id
    object.id
  end
  
  def current_user
    instance_options[:user]
  end
  
end
