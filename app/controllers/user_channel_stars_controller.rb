class UserChannelStarsController < ApplicationController

# Multipurpose create/destroy action based on whether a UserChannelStar
# matching the user and channel id parameters exists
def create
  authorize_request!(params[:user_id], params[:token])
  
  if @user_channel_star = UserChannelStar.find_by(channel_star_params)
    @user_channel_star.destroy
    render json: :destroyed
  elsif @user_channel_star = UserChannelStar.new(channel_star_params)
    if @user_channel_star.save
      render json: :ok
    else
      render json: @user_channel_star.errors, status: :unprocessable_entity
    end
  end
end


private

  def channel_star_params
    params.permit(:channel_id, :user_id)
  end
end
