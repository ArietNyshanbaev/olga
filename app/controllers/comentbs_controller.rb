class ComentbsController < ApplicationController
	def create
		
		@post = Micropost.find(params[:micropost_id].to_i)
		@comentb = current_user.comentbs.build(comentb_params)
		@comentb.micropost_id = @post.id

	    if @comentb.save
	      redirect_to :back
	    end
	end
	private

    def comentb_params
      params.require(:comentb).permit(:content)
    end
end
