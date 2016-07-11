class UserChannelStar < ApplicationRecord
  belongs_to :user
  belongs_to :channel
  
  scope :by_channel, -> channel_id { where(channel_id: channel_id) }
  
end
