class QuestionsController < ApplicationController

  def index
  end

  def new
    @question = Question.new
  end

  def create
  	question = Question.create(question_params)
  	redirect_to question_path(question)
  end

  def show
    @question = Question.find(params[:id])
    @comment = Comment.new

  end



  def show_comment
    
    @comment = Comment.new 
  
  
    respond_to do |format|
      format.js 
    end

  end

  
  private

  def question_params
  	params.require(:question).permit(:body)
  end


end
