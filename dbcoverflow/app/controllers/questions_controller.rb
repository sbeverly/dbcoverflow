class QuestionsController < ApplicationController	
	before_action :find_question, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

	def index
		if session[:user_id]
			@session = User.find(session[:user_id])
		end
		@question = Question.new
		@questions = Question.all
	end

	def show
		@answers = @question.answers
		@vote = Vote.new
	    @comment = Comment.new
	    @answer = Answer.new
	end

	def create
		@user = User.find(session[:user_id])
		@question = Question.create(body: params[:question][:body])
		@user.questions << @question
		@question.vote = Vote.create
		redirect_to root_path
	end

	def edit
	end

	def update
		@question.body = params[:question][:body]
		@question.save

		redirect_to root_path
	end

	def destroy
		@question.destroy

		redirect_to root_path
	end

	def upvote
		@question.vote.score += 1
		@question.vote.save
		redirect_to question_path(@question)
	end

	def downvote
		@question.vote.score -= 1
		@question.vote.save
		redirect_to question_path(@question)
	end

	private

	def question_params
		params.require(:question).permit(:body)
	end

	def find_question
		@question = Question.find(params[:id])
	end

end
