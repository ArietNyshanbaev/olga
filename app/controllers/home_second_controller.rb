class HomeSecondController < ApplicationController
  before_action :logged_in_user, only: [:main, :blog, :gallery]
  def main
  	@microposts = Micropost.first(3)
  	@micropost = Micropost.first(1)
    @pictures = Picture.first(12)
  end

  def blog
  	@microposts = Micropost.all.paginate(page: params[:page])
  end

  def gallery
  	@pictures = Picture.all.paginate(page: params[:page])
  end
  private
  def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to root_url
      end
    end
end
