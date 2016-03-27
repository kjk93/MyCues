class UserSettingsController < ApplicationController
	def edit
		@user = User.find(params[:id])
		@setting = @user.user_setting
	end

	def update
		@user_setting = UserSetting.find(params[:id])
		@user = @user_setting.user
		if @user_setting.update_attributes(settings_params)
			flash[:success] = "Defaults Updated"
			redirect_to @user
		else
			flash[:danger] = "Could not update defaults"
			render 'edit'
		end
	end

	def destroy
		@user_setting = UserSetting.find(params[:id])
		@user_setting.destroy
	end

	private
		def settings_params
			params.require(:user_setting).permit(:cue_time, :cue_number_gap, :start_cue)
		end
end
