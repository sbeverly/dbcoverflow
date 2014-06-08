require 'spec_helper'

describe "Votes" do
	
	before :each do
		visit questions_url
		@question = FactoryGirl.create(:question)
		@answer = FactoryGirl.create(:answer)
		@question.answers << @anwer
		click_link @question.body
	end

	describe "voting on questions" do

		it "by voting up" do
			# click_link "Up"
			# expect(page).to have_content("1")
		end

		it "by voting down" do
			# click_button "Down"
			# expect(page).to have_content("-1")
		end
	end

	describe "voting on answers" do
		it "by voting up" do
			# click_button "Up"
			# expect(page).to have_content("1")
		end

		it "by voting down" do
			# click_button "Down"
			# expect(page).to have_content("-1")
		end
	end
	
end