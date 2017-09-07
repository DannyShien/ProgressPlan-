class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.find_by(email: params[:email])
      if user.authenticate(params[:password])
        log_in(user)
        flash[:success] = "Logged In"
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
    redirect_to login_path, flash: {success: "Logged out."}
  end

  def callback 
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user
      log_in(user)
      redirect_to root_path, flash: {success: "Logged In"}
    else
      flash[:error] = "Login failed: #{user.error.full_messages.to_sentence}"
      redirect_to login_path
    end
  end
end
