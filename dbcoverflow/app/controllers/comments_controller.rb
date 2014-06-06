class CommentController < ApplicationController
  def index
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
    user = User.find(session[:user_id])
    user.comments.create(params[:comment])

  end

  def edit
  end

  def update
  end

  def destroy
  end

end
