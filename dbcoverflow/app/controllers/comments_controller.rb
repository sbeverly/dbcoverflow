class CommentsController < ApplicationController
  
  # def index
  #   # @commentable =  Question.find(params[:question_id])

  #   # # p @commentable
  #   # # p "******"
  #   # respond_to do |format|
  #   #   format.js { render :show_comment, :locals => {:commentable => @commentable}}
  #   # end
  # end

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

  # def show_comment
  #    @commentable =  Question.find(params[:question_id])

  #   # p @commentable
  #   # p "******"
  #   respond_to do |format|
  #     format.js { render :show_comment, :locals => {:commentable => @commentable}}
  #   end
  # end


  # def new
  #   @comment = Comment.new 
  # end


  def create

    p "****"
    # question = Question.find(params[:question_id])
    @commentable = find_commentable
    # p "***"
    # p params
    p @commentable
    p "*********"
    @commentable.comments.create(comment_params)
    # comment = Comment.create(comment_params)

    # p comment_params
    p "you got here!!!!"
    # p comment
    p "*"
    redirect_to :back

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


  def find_commentable
    if params[:question_id]
      Question.find(params[:question_id])
    else
      Answer.find(params[:answer_id])
    end
  end

end
