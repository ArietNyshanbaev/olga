class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
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