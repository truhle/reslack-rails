class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:email]);
    if (@user && @user.authenticate(params[:password]))
      render json: @user
    else
      render json: "Email or password incorrect", status: :unprocessable_entity
    end
  end

  def destroy
  end
  
end
