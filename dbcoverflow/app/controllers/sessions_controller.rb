class SessionsController < ApplicationController

	def create
		if user = User.authenticate(params[:username], params[:password])
			session[:user_id] = user.id
			redirect_to questions_url, notice: "Logged In!"
		else
			flash.now.alert = "Invalid Email or Password"
			render 'user_login'
		end
	end

	def destroy
		session[:current_user_id] = nil
		flash[:notice] = "You have successfully logged out."
		redirect_to questions_url
	end

end