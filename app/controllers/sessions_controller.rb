class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User find_by(email: params[:email])
      if user.authenticate(params[:password])
        log_in(@user)
      else
        flash[:error] = "Invalid password"
      end
    else
      flash[:error] = "Invalid email"
    end
    redirect_to login_path
  end

  def destroy
    log_out(current_user)
    redirect_to root_path
  end

end
