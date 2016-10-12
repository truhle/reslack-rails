class User < ApplicationRecord
  validates :email, :username, presence: true, uniqueness: true
  has_many :channel_users
  has_many :channels, through: :channel_users
  has_many :sessions
  has_many :starred_channels, through: :user_channel_stars, source: :channel
  has_many :messages, dependent: :destroy
  has_many :group_users
  has_many :groups, through: :group_users
  has_many :user_channel_stars
  has_many :user_group_presences
  has_many :user_message_stars
  has_many :starred_messages, through: :user_message_stars, source: :message
  
  has_secure_password
  
  def appear(group_id)
    # update(present: true)
    user_group_presences.create(group_id: group_id, presence: true)
    ActionCable.server.broadcast("appearance_#{group_id}", {user_id: id, present: true})
  end
  
  def disappear(group_id)
    # update(present: false)
    presences = user_group_presences.find_by(group_id: group_id)
    if presences
      presences.destroy
    end
    ActionCable.server.broadcast("appearance_#{group_id}", {user_id: id, present: false})
  end
  
  def channel_ids
    channels.pluck(:id)
  end
  
  def channels_by_group(group_id)     
    channels.merge(Channel.where(group_id: group_id))
  end
  
  def channel_starred?(channel_id)
    user_channel_stars.by_channel(channel_id).exists?
  end
  
  def group_ids
    groups.pluck(:id)
  end
  
  def message_starred?(message_id)
    user_message_stars.by_message(message_id).exists?
  end
  
  def starred_channel_ids
    user_channel_stars.pluck(:channel_id)
  end
  
  def starred_message_ids
    user_message_stars.pluck(:message_id)
  end
  
  def starred_channel_ids_by_group(group_id)
    starred_channels.merge(Channel.where(group_id: group_id)).pluck(:id)
  end
  
  def starred_message_ids_by_group(group_id)
    starred_messages.merge(Message.where(group_id: group_id)).pluck(:id)
  end
end
