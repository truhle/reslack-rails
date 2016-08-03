class GroupSerializer < ActiveModel::Serializer
  attributes :group_id, :group_name, :group_prefix, :current_user,  :messages
  has_many :users
  
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
