class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        
        redirect_back_or user
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
      
    else
      @user = User.new
      flash.now[:danger] = 'Invalid email/password combination try again'
      render "root_page/main"
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
