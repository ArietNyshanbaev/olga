class RootPageController < ApplicationController
  def main
  	@user = User.new
  end
end
