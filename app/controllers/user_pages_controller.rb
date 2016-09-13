class UserPagesController < ApplicationController
  before_action :set_user_page, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @user_pages = UserPage.all
    respond_with(@user_pages)
  end

  def show
    respond_with(@user_page)
  end

  def new
    @user_page = UserPage.new
    respond_with(@user_page)
  end

  def edit
  end

  def create
    @user_page = UserPage.new(user_page_params)
    @user_page.save
    respond_with(@user_page)
  end

  def update
    @user_page.update(user_page_params)
    respond_with(@user_page)
  end

  def destroy
    @user_page.destroy
    respond_with(@user_page)
  end

  private
    def set_user_page
      @user_page = UserPage.find(params[:id])
    end

    def user_page_params
      params[:user_page]
    end
end
