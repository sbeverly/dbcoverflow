class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.create(user_id: session[:user_id], 
                        question_id: @question.id, 
                        body: params[:answer][:body])

    redirect_to question_path(@question)
  end

  def update
  end

  def delete
  end
end