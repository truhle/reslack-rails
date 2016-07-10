class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :full_name, :present, :icon, :current_channel_id, :channels
  
  def channels
    object.channels.pluck(:name)
  end
end
