class QuestionsController < ApplicationController
	
	def index
		@question = Question.new
		@questions = Question.all
	end

	def show
		@question = Question.find(params[:id])
		@answers = @question.answers
	end

	def create
		@question = Question.create(body: params[:question][:body])
		redirect_to root_path
	end

	def edit
		@question = Question.find(params[:id])
		# render text: @question.inspect
	end

	def update
		@question = Question.find(params[:id])
		@question.body = params[:question][:body]
		@question.save

		redirect_to root_path
	end

	def delete
		
	end

	# def new
	# 	@question = Question.new(params[:question][:body])
	# end
end