class PhotoController < ApplicationController
  before_action :logged_in_user, only: [:post]
  def post
  	@picture = current_user.pictures.build
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
