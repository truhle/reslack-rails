class Session < ApplicationRecord
  before_create :generate_token
  
private
  def generate_token
    begin
      self.token = SecureRandom.urlsafe_base64
    end while self.class.exists?(token: token)
  end
end
