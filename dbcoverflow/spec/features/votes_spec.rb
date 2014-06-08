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
			click_link "q: Vote Up"
			expect(page).to have_content("q: 1")
		end

		it "by voting down" do
			click_link "q: Vote Down"
			expect(page).to have_content("q: -1")
		end
	end

	describe "voting on answers" do
		it "by voting up" do
			click_link "a: Vote Up"
			expect(page).to have_content("a: 1")
		end

		it "by voting down" do
			click_link "q: Vote Down"
			expect(page).to have_content("a: -1")
		end
	end
	
end