class RootPageController < ApplicationController
  def main
  	@user = User.new
  end
  def unsuccessful_registration
  	@user = User.new
  end
end
