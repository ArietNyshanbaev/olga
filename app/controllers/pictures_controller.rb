class PicturesController < ApplicationController
	before_action :logged_in_user, only: [:create, :show, :destroy]
  before_action :correct_user,   only: :destroy

  	def create
    @picture = current_user.pictures.build(picture_params)
    if @picture.save
      flash[:success] = "Picture is successfully added!"
      redirect_to gallery_path
    else
      @feed_items = []
      @user = current_user
      render photo_post_path
    end
  end

  def destroy
    @picture.destroy
    flash[:success] = "Picture deleted"
    redirect_to request.referrer || root_url
  end

  def show
    @picture = Picture.find(params[:id])
  end

  private

    def picture_params
      params.require(:picture).permit(:title, :description, :photo)
    end

    def correct_user
      @picture = current_user.pictures.find_by(id: params[:id])
      redirect_to root_url if @picture.nil?
    end
end
