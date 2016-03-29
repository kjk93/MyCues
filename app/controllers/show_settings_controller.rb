class ShowSettingsController < ApplicationController
  def edit
  	@show = Show.find(params[:id])
  	@setting = @show.show_setting
  end

  def update
  		@show_setting = ShowSetting.find(params[:id])
		@show = @show_setting.show
		if @show_setting.update_attributes(settings_params)
			flash[:success] = "Show Settings Updated"
			redirect_to edit_show_path(@show)
		else
			flash[:danger] = "Could not update defaults"
			render 'edit'
		end
  end

  def destroy
  	@show_setting = ShowSetting.find(params[:id])
  	@show_setting.destroy
  end

  	private
		def settings_params
			params.require(:show_setting).permit(:cue_time, :cue_number_gap, :start_cue)
		end
end
