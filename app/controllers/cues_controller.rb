class CuesController < ApplicationController
	def new
		@show = Show.find(params[:show_id])
		cues = @show.cues
		if cues.any?
			number_after = params[:cue_after]
			if number_after.to_i == -200 #flag for adding to end
				@cue_index = cues.index(cues.last)
			else
				idx = cues.index(cues.find_by(number: number_after))
				@cue_index = idx-1
			end
			@cue_before = Cue.find(cues[@cue_index].id)
			@cue_id = @cue_before.id
			@defaults = @show.show_setting

			#Pass New Cue Number
			if number_after.to_i == -200
				@new_num = @cue_before.number + @defaults.cue_number_gap
			else
				@cue_after = Cue.find(cues[idx].id)#finds cue after number
				if idx == 0
					@new_num = @cue_after.number
				else
					#Avgerages the cue before and the cue after
					@new_num = (@cue_after.number + @cue_before.number)/2
				end
			end
		end
		#@sorted = @show.cues.sort_by{|e| e[:number]}
		@cue = Cue.new

		respond_to do |format|
			format.html{}
			format.js{}
		end
	end

	def create
		@show = Show.find(params[:show])
		last_cue = @show.cues.last
		@cue = @show.cues.build(cue_params)
		@defaults = @show.show_setting
		@cue_before = Cue.find(params[:cue_before])
		if last_cue == @cue_before
			@last = true
		else
			@last = false
		end
		@new_cue = Cue.new

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

		respond_to do |format|
			format.html {}
			format.js {}
		end
	end

	def update
		@cue = Cue.find(params[:id])

		@show = @cue.show
		@defaults = @show.show_setting
		if @cue.update_attributes(cue_params)
			flash[:success] = "Cue #{decimal_format(@cue.number)} Updated"
			if @cue.follow_time.nil?
				@cue.update_attributes(follow: 0)
			end
			respond_to do |format|
				format.html {redirect_to edit_show_path(@show)}
				format.js {}
			end
		else
			flash[:danger] = "Could not update cue"
			render 'edit'
		end
	end


	def destroy
		@cue = Cue.find(params[:id])
		@show = @cue.show
		@defaults = @show.show_setting
		@cue_before = Cue.find(@show.cues[@show.cues.index(@show.cues.find_by(id: params[:id]))-1].id)
		@cue.destroy
		@new_cue = Cue.new

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
			params.require(:cue).permit(:auto_follow, :number, :time, :follow, :follow_time, :purpose, :called, :page)
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
