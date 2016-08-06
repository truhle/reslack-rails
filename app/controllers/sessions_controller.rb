class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:email]);
    if (@user && @user.authenticate(params[:password]))
      @session = Session.create(expires_at: 1.week.from_now, user_id: @user.id)
      render json: @session
    else
      render json: "Email or password incorrect", status: :unprocessable_entity
    end
  end

  def destroy
  end
  
end
