class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
  	@user = User.new  
  end

  def create
  	@user = User.new(user_params)

  	name = @user.email.split('@') 
    name = name[0].split('.')
    first_name = name[0].capitalize
    second_name = name[1].capitalize
    name = first_name + " " + second_name
    @user.name = name
    
    if @user.save
      flash[:success] = "Yahooo!"
      redirect_to @user # Handle a successful save.
    else
      render "root_page/main"
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
