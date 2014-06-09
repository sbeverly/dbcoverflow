class AnswersController < ApplicationController
  before_action :find_question, only: [:create, :upvote, :downvote]
  before_action :find_answer, only: [:upvote, :downvote]

  def create
    @answer = Answer.create(user_id: session[:user_id], question_id: @question.id, body: params[:answer][:body])
    @answer.vote = Vote.create
    redirect_to question_path(@question)
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    
    redirect_to question_path(params[:question_id])
  end

  def upvote
    @answer.vote.score += 1
    @answer.vote.save
    redirect_to question_path(@question)
  end

  def downvote
    @answer.vote.score -= 1
    @answer.vote.save
    redirect_to question_path(@question)
  end

  private

  def find_question
    @question = Question.find(params[:question_id])
  end

  def find_answer
    @answer = Answer.find(params[:answer_id])
  end
end