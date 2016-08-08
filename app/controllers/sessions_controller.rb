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
    @session = Session.find_by(token: params[:token], user_id: params[:user_id])
    if @session
      @session.destroy
      render json: "Session destroyed", status: :ok
    else
      render json: "Error: session couldn't be destroyed", status: :unprocessable_entity
    end
  end
  
end
