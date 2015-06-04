class BlogController < ApplicationController
  def post
  	@micropost = current_user.microposts.build
  end
end
