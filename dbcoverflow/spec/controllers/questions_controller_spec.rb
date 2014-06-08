require 'spec_helper'

describe QuestionsController do

	before(:each) do
		@test_user = User.create(username: 'sbeverly', email: 'skb14@pitt.edu')
		@test_user2 = User.create(username: 'afrankle', email: 'franks@dbc.com')


		@test_question = Question.create(body: 'Do all of these tests work?')
		@test_question.answers << Answer.create(user_id: 2, body: 'Let me google that for you') 
		@comment = Comment.create(user_id: 1,
								commentable_type: 'Question', 
								commentable_id: @test_question.id, 
								body: 'These tests are so helpful!')
	end

	describe '#index' do
		it 'it pulls all questions from database' do
			@questions = Question.all
			expect(@questions).to eq Question.all
		end
	end

	describe '#create' do
		it 'saves the newly created question to the database' do
			expect(Question.find(@test_question.id).body).to eq 'Do all of these tests work?'
			expect { Question.create(body: 'Is this going to increment the count by 1?') }.to change { Question.count }.by(1)
		end
	end

	describe '#show' do
		it 'finds the requested question in the database' do
			expect(@test_question).to eq Question.find(@test_question.id)
		end

		it 'finds the answers associated with the requested question' do
			expect(@test_question.answers).to eq Answer.where(question_id: @test_question.id)
		end

		it 'finds the comments associated with the requested question' do
			expect(@test_question.comments.first).to eq Comment.where(body: 'These tests are so helpful!').first
		end
	end
end