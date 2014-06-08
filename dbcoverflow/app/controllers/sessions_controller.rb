class SessionsController < ApplicationController

	def new
		@user = User.new
	end

	def create
		if user = User.authenticate(params[:username], params[:password])
			session[:user_id] = user.id
			redirect_to questions_url, notice: "Logged In!"
		else
			flash.now.alert = "Invalid Email or Password"
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "You have successfully logged out."
		redirect_to questions_url
	end

end