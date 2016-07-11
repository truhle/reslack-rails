class UserMessageStar < ApplicationRecord
  belongs_to :user
  belongs_to :message
  
  scope :by_message, -> message_id { where(message_id: message_id) }
end
