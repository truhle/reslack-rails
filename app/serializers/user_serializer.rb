class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :full_name, :present, :icon, :current_channel_id
end
