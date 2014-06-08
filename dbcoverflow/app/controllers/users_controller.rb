class UsersController < ApplicationController
	before_action :find_user, only: [:show, :edit, :update, :destroy]

	def index
		@users = User.all
	end

	def show
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			redirect_to user_path(@user)
		else
			flash[:alert] = "Dude. Enter the correct info yo."
			redirect_to new_user_path
		end
	end

	def edit
	end

	def update
		if @user.update(user_params)
			flash[:notice] = "User has been updated."
			redirect_to user_path(@user)
		else
			flash[:alert] = "User has not been updated ya idiot."
			redirect_to edit_user_path
		end
	end

	def destroy
		@user.destroy
		flash[:notice] = "Say bye bye."
		redirect_to questions_path
	end

	private

	def user_params
		params.require(:user).permit(:username, :password, :password_confirmation, :email)
	end

	def find_user
		@user = User.find(params[:id])
	end

end