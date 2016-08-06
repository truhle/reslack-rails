class Session < ApplicationRecord
  before_create :generate_token
  belongs_to :user
  
  def update_expiration!
    if expires_at < (5 * 24).hours.from_now
      update(expires_at: (7 * 24).hours.from_now)
    end
  end  
  
  
private
  def generate_token
    begin
      self.token = SecureRandom.urlsafe_base64
    end while self.class.exists?(token: token)
  end
end
