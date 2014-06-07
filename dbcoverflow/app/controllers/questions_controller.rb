class QuestionController < ApplicationController

  def index
  end

  def new
    @question = Question.find(params[:question_id])
  end

  def show
    question = Question.find(params[:question_id])

  end


end
