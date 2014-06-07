class CommentsController < ApplicationController
  def index
    # @commentable = find_commentable
    # @comments = @commentable.comments


  end

  def show

  end

  #this is going to render the comment form
  def new
    @comment = Comment.new
  end

  ##the comment form is going to post to this method.
  ##create the comment and link to user
  def create
    # @commentable = find_commentable
    # @comment = @commentable.comments.build(params[:comment])
    #   if @comment.save
    #     return "saved!"
    #   else
    #     # render :action => 'new'
    #     return "nope"
    #   end

    ##figure out how to save the comment to the QUESTION
    
    Comment.create(comment_params)
    # user = User.find(session[:user_id])
    # user.comments.create(params[:comment])

    redirect_to root_path
  end

  def edit
  end

  def update
  end

  def destroy
  end


  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id%/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end



  private

  def comment_params
    params.require(:comment).permit(:body)
  end


end
