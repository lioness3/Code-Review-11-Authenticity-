class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if params[:admin] == true
      @user.admin = true
    end
    @user.email.downcase!
    if @user.save
      flash.now.notice = "You've successfully signed up!"
      session[:user_id] = @user.id
      redirect_to "/"
    else
      flash.now.alert = "There was a problem signing up."
      redirect_to '/signup'
    end
  end


  private

  def user_params
    params.require(:user).permit(:email, :admin, :username, :password, :password_confirmation)
  end
end
