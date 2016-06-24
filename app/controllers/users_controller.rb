class UsersController < ApplicationController
  before_filter :skip_password_attribute, only: :update

  def new
    @user = User.new
  end

  def show
    require_login
    @user = User.find(params[:id])
    if request.xhr?
      render json: {  userName: @user.name,
                      userPhase: @user.current_phase,
                      userPhone: @user.phone_number,
                      userDescription: @user.description }
    else
      @user
    end
  end

  def edit
    @user = User.find(params[:id])
    if current_user != @user
      flash[:danger] = "Can't edit other's profiles!"
      session[:user_id] = nil
      redirect_to login_path
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to offerings_path
    else
      render "new"
    end
  end

  def messages

  end


  def update
   @user = User.find(params[:id])
   if current_user != @user
     flash[:danger] = "Can't edit other's profiles!"
     session[:user_id] = nil
     redirect_to login_path
   end
   if @user.update(edit_user_params)
     redirect_to @user
   else
     render "edit"
   end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :phone_number)
    end

    def edit_user_params
      params.require(:user).permit(:name, :password, :phone_number, :description, :current_phase)
    end

  def skip_password_attribute
    if params[:password].blank?
      params.except!(:password)
    end
  end

end
