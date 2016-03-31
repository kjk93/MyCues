class ShowsController < ApplicationController
	def new
		@show = Show.new
	end

	def create
		@show = current_user.shows.build(show_params)
		if @show.save
			@settings = @show.build_show_setting(cue_time: current_user.user_setting.cue_time, cue_number_gap: current_user.user_setting.cue_number_gap, start_cue: current_user.user_setting.start_cue)
			if @settings.save
				flash[:success] = "#{@show.title} Created"
				redirect_to edit_show_path(@show)
			else
				flash[:danger] = "Settings could not be create"
				render 'new'
			end
		else
			flash[:danger] = "Show could not be created"
			render 'new'
		end
	end

	def show
		@show = Show.find(params[:id])
		@cues = @show.cues
	end

	def edit
		@show = Show.find(params[:id])
		@cues = @show.cues
		@cue = Cue.new
		@defaults = @show.show_setting
		@sorted = @cues.sort_by{|e| e[:number]}
	end

	def update
		@show = Show.find(:id)
		@user = @show.user
		if @show.update_attributes(show_params)
			flash[:success] = "#{@show.title} updated"
			redirect_to @user
		else
			flash[:danger] = "Show could not be updated"
			render 'edit'
		end
	end

	def destroy
		@show = Show.find(params[:id]).destroy
		flash[:success] = "#{@show.title} deleted"
		redirect_to @show.user
	end

	private
		def show_params
			params.require(:show).permit(:title)
		end
end
