class CommentsController < ApplicationController


  def new
    @commentable = find_commentable

    respond_to do |format|
      if @commentable.class == Question
        format.js { render :show_comment_question, :locals => {:commentable => @commentable}}
      else
        format.js { render :show_comment_answer, :locals => {:commentable => @commentable}}
      end
    end
  end



  def create
    @user = User.find(session[:user_id])
    @commentable = find_commentable
    @comment = Comment.create(user: @user, body: params[:comment][:body] )
    # @comment = Comment.create(comment_params)
    @commentable.comments << @comment
    redirect_to :back

  end


  private

  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end


  def find_commentable
    if params[:question_id]
      Question.find(params[:question_id])
    else
      Answer.find(params[:answer_id])
    end
  end


end
