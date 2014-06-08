class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.create(user_id: session[:user_id], 
                        question_id: @question.id, 
                        body: params[:answer][:body])

    redirect_to question_path(@question)
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    
    redirect_to question_path(params[:question_id])
  end
end