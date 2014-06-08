class VotesController < ApplicationController

	def create
		@vote = Vote.create(vote_params)
		@question = Question.find(params[:question_id])
		redirect_to question_path(@question)
	end

	private

	def vote_params
		params.require(:vote).permit(:score)
	end

end