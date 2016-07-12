class UserMessageStarsController < ApplicationController

# Multipurpose create/destroy action based on whether a UserMessageStar
# matching the user and message id parameters exists
def create
  if @user_message_star = UserMessageStar.find_by(message_star_params)
    @user_message_star.destroy
    render json: :destroyed
  elsif @user_message_star = UserMessageStar.new(message_star_params)
    if @user_message_star.save
      render json: :ok
    else
      render json: @user_message_star.errors, status: :unprocessable_entity
    end
  end
end


private

  def message_star_params
    params.permit(:message_id, :user_id)
  end
end
