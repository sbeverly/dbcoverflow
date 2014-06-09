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
    p "heres the comment params"
    p comment_params
    p "****"
    @user = User.find(session[:user_id])
    @commentable = find_commentable
    # p "***"
    p "heres the params"
    p params
    p "*********"
    @comment = Comment.create(user_id: session[:user_id], body: comment_params[:body])
    @commentable.comments << @comment
  
    # @commentable.comments.create(comment_params)
    # comment = Comment.create(comment_params)

    # p comment_params
    p "you got here!!!!"
    p @commentable.comments
    p @user.comments

    p "*"
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
