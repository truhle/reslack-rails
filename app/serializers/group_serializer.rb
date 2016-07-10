class GroupSerializer < ActiveModel::Serializer
  attributes :group_id, :group_name, :current_user,  :messages
  has_many :users
  has_many :channels, key: :all_channels do |serializer|
    serializer.current_user.channels.where(group_id: serializer.group_id)
  end
  
  
  def group_id
    object.id
  end
  
  def current_user
    object.users.find(instance_options[:user_id])
  end
  
  # def all_channels
  #   # current_user.channels.merge(Channel.where(group_id: group_id))
  #   current_user.channels_by_group(group_id)
  # end
  
  def messages
    object.messages
  end
  # 
  # def users
  #   object.users
  # end
end
