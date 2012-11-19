require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @input_passing_attributes = {
      name:                  "sam",
      current_password:      "secret", 
      password:              "private",
      password_confirmation: "private"
    }
    @input_failing_attributes = {
      name:                  "sam",
      current_password:      "fail", 
      password:              "private",
      password_confirmation: "private"
    }
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  #...
  test "should create user" do
    assert_difference('User.count') do
      post :create, user: @input_passing_attributes
    end
    assert_redirected_to users_path
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  #...
  test "should update user when current password is correct" do
    put :update, id: @user, user: @input_passing_attributes
    assert_redirected_to users_url
  end

  test "should not update user if current password in incorrect" do
    put :update, id: @user, user: @input_failing_attributes
    assert_template :edit
  end
  
  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end