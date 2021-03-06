class UsersController < ApplicationController
  before_action :require_login, only: [:index]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in(@user)
      redirect_to root_path
    else 
      render 'new'
    end
  end

  def index
    @users = User.all.order("created_at DESC")
  end
  
  private
  
  def user_params 
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
