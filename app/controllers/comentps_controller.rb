class ComentpsController < ApplicationController
	def create
		
		@picture = Picture.find(params[:picture_id].to_i)
		@comentp = current_user.comentps.build(comentp_params)
		@comentp.picture_id = @picture.id

	    if @comentp.save
	      redirect_to :back
	    end
	end
	private

    def comentp_params
      params.require(:comentp).permit(:content)
    end
end
