class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])

		if @user.save
			redirect_to user_path(@user)
		else
			flash[:alert] = "Dude. Enter the correct info yo."
			redirect_to new_user_path
		end
	end

end