require 'test_helper'

class UserPagesControllerTest < ActionController::TestCase
  setup do
    @user_page = user_pages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_page" do
    assert_difference('UserPage.count') do
      post :create, user_page: {  }
    end

    assert_redirected_to user_page_path(assigns(:user_page))
  end

  test "should show user_page" do
    get :show, id: @user_page
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_page
    assert_response :success
  end

  test "should update user_page" do
    patch :update, id: @user_page, user_page: {  }
    assert_redirected_to user_page_path(assigns(:user_page))
  end

  test "should destroy user_page" do
    assert_difference('UserPage.count', -1) do
      delete :destroy, id: @user_page
    end

    assert_redirected_to user_pages_path
  end
end
