class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  has_many :channel_users
  has_many :channels, through: :channel_users
  has_many :messages, dependent: :destroy
  has_many :group_users
  has_many :groups, through: :group_users
  has_many :user_channel_stars
  has_many :user_message_stars
  
end
