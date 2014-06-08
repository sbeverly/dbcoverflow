class CommentsController < ApplicationController
  
  def index
    @commentable = Question.find(params[:question_id])

    respond_to do |format|
      format.js { render :show_comment, :locals => {:commentable => @commentable}}
    end
  end

  def new
    @comment = Comment.new 
    
    respond_to do |format|
      format.js 
    end

  end

  def create
    question = Question.find(params[:question_id])
    question.comments.create(comment_params)
    redirect_to root_path
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
