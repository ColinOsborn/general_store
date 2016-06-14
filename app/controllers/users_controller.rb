class UsersController < ApplicationController
  def show
    @user = current_user
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to the General Store"
      redirect_to "/dashboard"
    else
      flash.now[:error] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end

end
