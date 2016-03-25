class UsersController < ApplicationController
	before_action :logged_in_user, only: [:show]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if User.first.nil?
			if @user.save
				@user.update_attributes(admin: true)
				if @user.admin == true
					message = "Admin profile create"
				end
				@setting = @user.build_user_setting
				if @setting.save
					flash[:success] = message
					redirect_to user_path(@user)
				else
					message = "Could not create settings"
				end
			else
				render 'new'
			end
		else
			if @user.save
				message = "Welcome " + @user.name
				@setting = @user.build_user_setting
				if @setting.save
					flash[:success] = message
					redirect_to user_path(@user)
				else
					message = "Could not create settings"
				end
			else
				render 'new'
			end
		end
	end

	def show
		@user = User.find(params[:id])
		@shows = @user.shows
	end

	private
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end
end
