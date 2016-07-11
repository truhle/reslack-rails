class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  has_many :channel_users
  has_many :channels, through: :channel_users
  has_many :messages, dependent: :destroy
  has_many :group_users
  has_many :groups, through: :group_users
  has_many :user_channel_stars
  has_many :user_message_stars
  
  def channels_by_group(group_id)     
    channels.merge(Channel.where(group_id: group_id))
  end
  
  def channel_starred?(channel_id)
    user_channel_stars.by_channel(channel_id).exists?
  end
  
  def message_starred?(message_id)
    user_message_stars.by_message(message_id).exists?
  end
end
