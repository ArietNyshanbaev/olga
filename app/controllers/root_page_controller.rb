class RootPageController < ApplicationController
  before_action :not_logged_in_user, only: [:main]
  def main
  	@user = User.new
  end
  def unsuccessful_registration
  	@user = User.new
  end

  private

  def not_logged_in_user
      unless !logged_in?
        redirect_to '/home_s'
      end
    end
end
