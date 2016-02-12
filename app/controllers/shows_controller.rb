class ShowsController < ApplicationController
	def new
		@show = Show.new
	end

	def create
		@show = current_user.shows.build(show_params)
		if @show.save
			flash[:success] = "#{@show.title} Created"
			redirect_to @show
		else
			flash[:danger] = "Show could not be created"
			render 'new'
		end
	end

	def show
		@show = Show.find(params[:id])
		@cues = @show.cues
	end

	def destroy
		@show = Show.find(params[:id])
		@show.delete
		flash[:success] = "#{@show.title} deleted"
		redirect_to @show.user
	end

	private
		def show_params
			params.require(:show).permit(:title)
		end
end
