class HomeSecondController < ApplicationController
  def main
  	@microposts = Micropost.last(3)
  	@micropost = Micropost.last

  end

  def blog
  	
  end

  def gallery
  	
  end
end
