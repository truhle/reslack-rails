class Message < ApplicationRecord
  belongs_to :user
  belongs_to :channel
  has_many :user_message_stars
end
