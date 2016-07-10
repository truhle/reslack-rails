class Message < ApplicationRecord
  belongs_to :user
  belongs_to :channel
  belongs_to :group
  has_many :user_message_stars
  
  scope :by_channel, -> channel_id { where(channel_id: channel_id) }
  scope :by_user, -> user_id { where(user_id: user_id) }
  scope :by_group, -> group_id { where(group_id: group_id)} 
end
