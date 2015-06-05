class PhotoController < ApplicationController
  def post
  	@picture = current_user.pictures.build
  end
end
