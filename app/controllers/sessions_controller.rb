class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to "/dashboard"
    else
      flash.now[:alert] = "Invalid email/password combination. Try Again."
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end
end
