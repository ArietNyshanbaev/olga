class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :show, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy


  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
  	@user = User.new  
  end

  def create
  	@user = User.new(user_params)

    if @user.save
      UserMailer.account_activation(@user).deliver_now
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      name = @user.email.split('@') 
  	  name = name[0].split('.')
  	  first_name = name[0].capitalize
  	  second_name = name[1].capitalize
  	  name = first_name + " " + second_name
  	  @user.name = name
  	  @user.save
  	  
      
      redirect_to root_url # Handle a successful save.
    else
      render "root_page/unsuccessful_registration"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:info] = "Ur password is successfuly changed"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to root_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(home_s) unless @user == current_user
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
