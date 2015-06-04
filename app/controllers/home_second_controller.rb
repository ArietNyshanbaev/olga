class HomeSecondController < ApplicationController
  def main
  	@microposts = Micropost.first(3)
  	@micropost = Micropost.first

  end

  def blog
  	@microposts = Micropost.all.paginate(page: params[:page])
  end

  def gallery
  	
  end
end
