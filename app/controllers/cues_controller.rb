class CuesController < ApplicationController
	def new
		@show = Show.find(params[:show_id])
		@cue = Cue.new
	end

	def create
		@show = Show.find(params[:show_id])
		cue = @show.cues.build(cue_params)
		if cue.save
			flash[:success] = "Cue Added"
			redirect_to @show
		else
			flash[:danger] = "Cue could not be created"
			render 'new'
		end
	end

	def destroy
	end

	def show
		@cue = Cue.find(params[:id])
		@show = @cue.show
	end

	private
		def cue_params
			params.require(:cue).permit(:auto_follow, :number, :time, :follow, :follow_time, :purpose, :page)
		end
end
