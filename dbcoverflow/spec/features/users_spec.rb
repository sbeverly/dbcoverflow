require 'spec_helper'

describe "User" do

	describe "New User" do

		# before :each do
		# 	visit questions_url
		# 	click_link "Create New User"
		# end

		before :each do
			visit new_user_url
		end

		context "can create a new account with VALID attr" do

			it "by navigating to the user sign up page" do
				expect(page.current_url).to eq new_user_url
			end

			it "by submitting valid user credentials" do
				fill_in 'Username', with: 'ExampleUsername'
				fill_in 'Password', with: 'password'
				fill_in 'Password confirmation', with: "password"
				fill_in "Email", with: 'example@yahoo.com'
				click_button 'Create User'

				user = User.where(username: 'ExampleUsername').first
				expect(page.current_url).to eq(user_url(user))
			end
		end

		context "can NOT create a new account with INVALID attr" do

			after :each do
				click_button 'Create User'
				expect(page.current_url).to eq(new_user_url)
			end

			it "by creating a new user with no username" do
				fill_in 'Username', with: ''
				fill_in 'Password', with: 'password'
				fill_in 'Password confirmation', with: 'password'
				fill_in "Email", with: 'example@yahoo.com'
			end

			it "by creating a new user with no email address" do
				fill_in 'Username', with: 'ExampleUsername'
				fill_in 'Password', with: 'password'
				fill_in 'Password confirmation', with: 'password'
				fill_in "Email", with: ''
			end

			it "by creating a new user with no password" do
				fill_in 'Username', with: 'ExampleUsername'
				fill_in 'Password', with: ''
				fill_in 'Password confirmation', with: ''
				fill_in "Email", with: 'example@yahoo.com'
			end

			it "by submitting a username less than 3 chars" do
				fill_in 'Username', with: 'Ex'
				fill_in 'Password', with: 'password'
				fill_in 'Password confirmation', with: 'password'
				fill_in "Email", with: 'example@yahoo.com'
			end

			it "by submitting an invalid email address" do
				fill_in 'Username', with: 'ExampleUsername'
				fill_in 'Password', with: 'password'
				fill_in 'Password confirmation', with: 'password'
				fill_in "Email", with: 'bad_example.com'
			end

			it "by submitting an invalid password confirmation" do
				fill_in 'Username', with: 'ExampleUsername'
				fill_in 'Password', with: 'password'
				fill_in 'Password confirmation', with: 'not'
				fill_in "Email", with: 'example@yahoo.com'
			end
		end
	end

	describe "Existing User" do
		before :each do
			@user = FactoryGirl.create(:user)
			visit user_url(@user)
		end
		

		context "can update a user" do
			it "by changing one of the user's attributes" do
				click_button "Update Profile"
				fill_in 'Username', with: "new_username"
				click_button 'Update'
				epect(page).to have_content('User has been updated.')
			end
		end

		context "can delete a user" do
			it "by clicking the 'delete user' button " do
				click_button "Delete Account"
				expect(page.current_url).to eq(questions_url)
				expect(page).to have_content('Say bye bye.')
			end
		end
	end

end