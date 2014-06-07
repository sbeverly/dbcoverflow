class QuestionsController < ApplicationController
	
	def index
		@question = Question.new
		@questions = Question.all
	end

	def new
		@question = Question.new(params[:question][:body])
	end

	def show
		@question = Question.find(params[:id])
		@answers = @question.answers
		@comments
	end

	def create
		@question = Question.create(body: params[:question][:body])
		redirect_to root_path
	end

	def edit
		
	end

	def update
		
	end

	def delete
		
	end
end