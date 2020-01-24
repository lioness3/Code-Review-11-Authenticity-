class SessionsController < ApplicationController
  def create
    @user = User.authenticate(params[:email].downcase, params[:password])
    if @user
      flash.now.notice = "You've signed in."
      session[:user_id] = @user.id
      redirect_to "/"
    else
    flash.now.alert = "There was a problem signing in. Please try again."
      redirect_to signin_path
    end
  end

  def destroy
    session[:user_id] = nil
  flash.now.notice = "You've signed out."
    redirect_to "/"
  end
end
