class QuestionsController < ApplicationController	
	def index
		if session[:user_id]
			@session = User.find(session[:user_id])
		end
		@question = Question.new
		@questions = Question.all
	end

	def show
		@question = Question.find(params[:id])
		@answers = @question.answers
		@vote = Vote.new
	    @comment = Comment.new
	    @answer = Answer.new
	end

	def create
		@question = Question.create(body: params[:question][:body])
		redirect_to root_path
	end

	def edit
		@question = Question.find(params[:id])
	end

	def update
		@question = Question.find(params[:id])
		@question.body = params[:question][:body]
		@question.save

		redirect_to root_path
	end

	def destroy
		@question = Question.find(params[:id])
		@question.destroy

		redirect_to root_path
	end

	def upvote
	end

	def downvote
	end

	private

	def question_params
		params.require(:question).permit(:body)
	end
end
