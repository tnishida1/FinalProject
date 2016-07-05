require 'test_helper'

class OwnerUsersControllerTest < ActionController::TestCase
  setup do
    @owner_user = owner_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:owner_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create owner_user" do
    assert_difference('OwnerUser.count') do
      post :create, owner_user: { owner_id: @owner_user.owner_id, user_id: @owner_user.user_id }
    end

    assert_redirected_to owner_user_path(assigns(:owner_user))
  end

  test "should show owner_user" do
    get :show, id: @owner_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @owner_user
    assert_response :success
  end

  test "should update owner_user" do
    patch :update, id: @owner_user, owner_user: { owner_id: @owner_user.owner_id, user_id: @owner_user.user_id }
    assert_redirected_to owner_user_path(assigns(:owner_user))
  end

  test "should destroy owner_user" do
    assert_difference('OwnerUser.count', -1) do
      delete :destroy, id: @owner_user
    end

    assert_redirected_to owner_users_path
  end
end
