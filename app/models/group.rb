class Group < ApplicationRecord
  validates :group_name, :group_prefix, presence: true
  validates :group_prefix, uniqueness: true
  
  has_many :channels
  has_many :group_users
  has_many :users, through: :group_users
  has_many :user_group_presences
  has_many :messages
  
end
