class SessionsController < ApplicationController

	def create
		if user = User.authenticate(params[:username], params[:password])
			session[:current_user_id] = user.id
			redirect_to questions_url
		end
	end

	def destroy
		@current_user = session[:current_user_id] = nil
		redirect_to questions_url
	end

end