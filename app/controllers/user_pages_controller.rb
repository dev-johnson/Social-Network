  class UserPagesController < ApplicationController
  before_action :set_user_page, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    if  user_signed_in?
      @user_pages = UserPage.all
      @user_page = UserPage.new
      respond_with(@user_pages)
  else
    redirect_to '/login'
  end
  end

  def show
    @user_page = UserPage.find(params[:id])
    respond_with(@user_page)
  end

  def new
    @user_page = UserPage.new
    @comment = Comment.new
    respond_with(@user_page)
  end

  def edit
  end

  def create
    @user_page = UserPage.new(user_page_params)
    begin
      raise unless current_user.approved == "true"
        @user_name= User.find(current_user.id)
        @full_name = "#{@user_name.first_name } #{ @user_name.last_name}"
        @user_page.user_id = @user_name.id
        @user_page.name = @full_name
        @user_page.like=0
        @user_page.save
        redirect_to root_path and return
        respond_with(@user_page)

    rescue Exception => e
     redirect_to :back
      flash[:notice] = "You are not yet approved to do a post"

    end
  end

  def update
    @user_page.update(user_page_params)
    respond_with(@user_page)
  end

  def destroy
    @user_page.destroy
    respond_with(@user_page)
  end

    def like_count
      begin
        @count= UserPage.find(params[:getId])
        @count.like =@count.like+1
        @count.save
        render json: {value: @count.like}, status: 200
      rescue Exception => e
        render nothing: true, status: 500
      end
  end

  private
    def set_user_page
      @user_page = UserPage.find(params[:id])
    end

    def user_page_params
      params[:user_page].permit(:post, :name, :user_id)
    end
end
