class HomeSecondController < ApplicationController
  def main
  	@microposts = Micropost.first(3)
  	@micropost = Micropost.first
    @pictures = Picture.first(12)
  end

  def blog
  	@microposts = Micropost.all.paginate(page: params[:page])
  end

  def gallery
  	@pictures = Picture.all.paginate(page: params[:page])
  end
end
