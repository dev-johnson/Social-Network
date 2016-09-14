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
    begin
      @user_page = UserPage.find params[:comment][:user_page_id]
      raise if @user_page.blank?
      @user_page.comments.create(user_id: current_user.id, comment_line: params[:comment][:comment_line])
      flash[:notice] = "Updated successfully"
      redirect_to :back
    rescue Exception => e
      flash[:notice] = "You are not yet approved to do a post"
      redirect_to :back
    end
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
