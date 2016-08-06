class NotAuthorizedError < StandardError
end

class ApplicationController < ActionController::API
  
  rescue_from NotAuthorizedError, with: :request_not_authorized
  
  def authorize_request!(user_id, token)
    @token = Session.where("expires_at > ?", Time.now)
                    .find_by(user_id: user_id, token: token)
    if @token
      @token.update_expiration!
    else
      fail NotAuthorizedError
    end
  end
  
private

  def request_not_authorized
    render json: "Session not valid", status: :unauthorized
  end
  
end
