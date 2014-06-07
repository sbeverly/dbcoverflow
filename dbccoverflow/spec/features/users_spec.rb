require 'spec_helper'

describe "User" do

	context "a user can create a new account with VALID attr" do

		before :each do
			visit root_url
			click_link "Create New User"
		end

		it "by navigating to the user sign up page" do
			expect(page.url).to eq new_user_url
		end

		it "by submitting valid user credentials" do
			fill_in 'Username', with: 'ExampleUsername'
			fill_in 'Password', with: 'password'
			fill_in 'Password Confirmation', with: "password"
			fill_in "Email", with: 'example@yahoo.com'
			click_button 'Create User'

			user = User.where(username: 'ExampleUsername').first
			expect(page.current_url).to eq(user_url(user))
		end
	end

	context "a user can NOT create a new account with INVALID attr" do

		after :each do
			click_button 'Create User'
			expect(page.current_url).to eq(user_url(user))
		end

		it "by createing a new user with no username" do
			fill_in 'Username', with: ''
			fill_in 'Password', with: 'password'
			fill_in 'Password Confirmation', with: 'password'
			fill_in "Email", with: 'example@yahoo.com'
		end

		it "by creatgin a new user with no email address" do
			fill_in 'Username', with: 'ExampleUsername'
			fill_in 'Password', with: 'password'
			fill_in 'Password Confirmation', with: 'password'
			fill_in "Email", with: ''
		end

		it "by creating a new user with no password" do
			fill_in 'Username', with: 'ExampleUsername'
			fill_in 'Password', with: ''
			fill_in 'Password Confirmation', with: ''
			fill_in "Email", with: 'example@yahoo.com'
		end

		it "by submitting a username less than 3 chars" do
			fill_in 'Username', with: 'Ex'
			fill_in 'Password', with: 'password'
			fill_in 'Password Confirmation', with: 'password'
			fill_in "Email", with: 'example@yahoo.com'
		end

		it "by submitting a password less than 6 chars" do
			fill_in 'Username', with: 'ExampleUsername'
			fill_in 'Password', with: 'pass'
			fill_in 'Password Confirmation', with: 'pass'
			fill_in "Email", with: 'example@yahoo.com'
		end

		it "by submitting an invalid email address" do
			fill_in 'Username', with: 'ExampleUsername'
			fill_in 'Password', with: 'password'
			fill_in 'Password Confirmation', with: 'password'
			fill_in "Email", with: 'bad_example.com'
		end

		it "by submitting an invalid password confirmation" do
			fill_in 'Username', with: 'ExampleUsername'
			fill_in 'Password', with: 'password'
			fill_in 'Password Confirmation', with: 'not'
			fill_in "Email", with: 'example@yahoo.com'
		end

	end
	
end