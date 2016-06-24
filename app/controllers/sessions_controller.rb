class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to offerings_path
    else
      flash[:danger] = "Invalid Login"
      render "new"
    end
  end

  def destroy
    session.clear
    current_user = nil
    flash[:success] = "Logout successful!"
    redirect_to login_path
  end

end
