class CuesController < ApplicationController
	def new
		@show = Show.find(params[:show_id])
		cues = @show.cues
		number_after = params[:cue_after]
		@cue_index = cues.index(cues.find_by(number: number_after))-1
		@cue_number = cues[@cue_index].id
		@defaults = @show.show_setting
		@sorted = @show.cues.sort_by{|e| e[:number]}
		@cue = Cue.new

		respond_to do |format|
			format.html{}
			format.js{}
		end
	end

	def create
		@show = Show.find(params[:show])
		@cue = @show.cues.build(cue_params)
		@defaults = @show.show_setting

		respond_to do |format|
			if @cue.save
				@sorted = @show.cues.sort_by{|e| e[:number]}
				format.html {html_create_response(@show.id)}
				format.js {}
				format.json {render json: @cue, status: :created, location: @cue}
			else
				format.html {html_create_error}
			end
		end
	end

	def edit
		@cue = Cue.find(params[:id])
		@show = Show.find(@cue.show)
		@defaults = @show.show_setting
		@sorted = @show.cues.sort_by{|e| e[:number]}
	end

	def update
		@show = Show.find(params[:show_id])
		@cue = Cue.find(params[:id])
		if @cue.update_attributes(cue_params)
			flash[:success] = "Cue #{decimal_format(@cue.number)} Updated"
			redirect_to edit_show_path(@show)
		else
			flash[:danger] = "Could not update cue"
			render 'edit'
		end
	end


	def destroy
		@cue = Cue.find(params[:id]).destroy

		respond_to do |format|
			format.html {html_delete_response(@cue.id)}
			format.js {}
		end
	end

	def show
		@cue = Cue.find(params[:id])
	end

	private
		def cue_params
			params.require(:cue).permit(:auto_follow, :number, :time, :follow, :follow_time, :purpose, :page)
		end

		def decimal_format(number)
			if number.floor == number
				number.round
			else
				number
			end
		end

		def html_create_response(show_id)
			@show = Show.find(show_id)
			flash[:success] = "Cue Added"
			redirect_to edit_show_path(@show)
		end

		def html_create_error
			flash[:danger] = "Cue could not be created"
			render 'new'
		end

		def html_delete_response(cue_id)
			@cue = Cue.find(cue_id)
			flash[:success] = "Cue #{decimal_format(@cue.number)} deleted"
			redirect_to edit_show_path(@cue.show)
		end
end
