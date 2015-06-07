class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :show, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost is successfully created!"
      redirect_to blog_path
    else
      @feed_items = []
      @user = current_user
      render blog_post_path
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end

  def show
    @post = Micropost.find(params[:id])
    @comentb = current_user.comentbs.build
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content, :picture, :title, :description)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
