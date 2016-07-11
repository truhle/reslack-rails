class Channel < ApplicationRecord
  belongs_to :group
  has_many :messages, dependent: :destroy
  has_many :channel_users
  has_many :users, through: :channel_users
  has_many :user_channel_stars
  
  scope :by_group, -> group_id { where(group_id: group_id) }
end
