class CommentsController < ApplicationController
 respond_to :html
  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
    respond_with(@comment)
  end

  def create
  end

  def update
    @comment.update(comment_params)
    respond_with(@comment)
  end

  def destroy
    @user_page.destroy
    respond_with(@comment)
  end



  private

  def comment_params
    params[:comment].permit(:user_id, :user_page_id, :holder, :comment_line)
  end
end
