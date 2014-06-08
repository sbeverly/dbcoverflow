class SessionsController < ApplicationController

	def new
		@user = User.new
	end

	def create
		if user = User.find_by_username(params[:username])
			if user.authenticate(params[:password])
				session[:user_id] = user.id
				redirect_to questions_url, notice: "Logged In!"
			else
				flash.now.alert = "Invalid Password"
				render 'new'
			end
		else
			flash.now.alert = "Invalid Username"
			render 'new'
		end
	end

	def destroy
		reset_session
		flash[:notice] = "You have successfully logged out."
		redirect_to questions_url
	end
end