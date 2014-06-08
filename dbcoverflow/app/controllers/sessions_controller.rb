class SessionsController < ApplicationController

	def new
		@user = User.new
	end

	def create
		user = User.find_by_username(params[:username])
		if user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to questions_url, notice: "Logged In!"
		else
			flash.now.alert = "Invalid Email or Password"
			render 'new'
		end
	end

	def destroy
		reset_session
		flash[:notice] = "You have successfully logged out."
		redirect_to questions_url
	end
end