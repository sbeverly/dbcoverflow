require 'spec_helper'

describe UsersController do

	describe "GET #index" do
		it "assigns all users to @users" do
			user1 = FactoryGirl.create(:user)
			user2 = FactoryGirl.create(:user, username: "alexander", email: "alex@yahoo.com")
			get :index
			expect(assigns(:users)).to match_array([user1, user2])
		end

		it "renders the :index template" do
			get :index
			expect(response).to render_template :index
		end
	end

	describe "GET #show" do

		before :each do
			@user = FactoryGirl.create(:user)
			get :show, id: @user
		end

		it "assigns the requested user to @user" do
			expect(assigns(:user)).to eq @user
		end

		it "renders the :show template" do
			expect(response).to render_template :show
		end
	end

	describe "GET #new" do
		it "assigns a new user to @user" do
			get :new
			expect(assigns(:user)).to be_a_new(User)
		end

		it "renders the :new template" do
			get :new
			expect(response).to render_template :new
		end
	end

	describe "POST #create" do
		context "with VALID attributes" do
			it "saves the new contact in the database" do
				expect {
					post :create, user: FactoryGirl.attributes_for(:user)
					}.to change(User, :count).by(1)
			end

			it "redirects to user#show" do
				post :create, user: FactoryGirl.attributes_for(:user)
				expect(response).to redirect_to user_path(assigns[:user])
			end
		end

		context "with INVALID attributes" do
			it "does NOT save the new contact in the databse" do
				expect {
					post :create, user: FactoryGirl.attributes_for(:user, username: 'ex')
					}.to change(User, :count).by(0)
			end

			it "re-renders the :new template" do
				post :create, user: FactoryGirl.attributes_for(:user, username: 'ex')
				expect(response).to redirect_to new_user_path
			end
		end
	end

	describe "GET #edit" do
	end

	describe "PUT #update" do
	end

	describe "DELETE #destroy" do
	end
	
end