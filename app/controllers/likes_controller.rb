class LikesController < ApplicationController
  respond_to :html
  def index

    @likes = Like.all

  end

  def like_count

    begin
       @user_page = UserPage.find(params[:getId])
       @user = UserPage.last.likes.where(user_id: "#{current_user.id}")
      raise if @user_page.blank? || @user.exists?
      @like = Like.new
      @like.user_id = current_user.id
      @like.user_page_id = @user_page.id
      @like.like_status = "like"
      @like.save
      @like_count = Like.where("like_status = 'like'AND user_page_id = #{@user_page.id}").count
      render json: {value: @like_count}, status: 200
      redirect_to :back

    rescue Exception => e
      # flash[:alert] = "not allowed"
    end

  end


  private

  def like_params
       params[:like].permit(:user_id, :user_page_id, :comments_id, :like_status)
  end
end
