require "test_helper"

class MyDesksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_desks_index_url
    assert_response :success
  end

  test "should get new" do
    get my_desks_new_url
    assert_response :success
  end

  test "should get create" do
    get my_desks_create_url
    assert_response :success
  end

  test "should get edit" do
    get my_desks_edit_url
    assert_response :success
  end

  test "should get update" do
    get my_desks_update_url
    assert_response :success
  end

  test "should get destroy" do
    get my_desks_destroy_url
    assert_response :success
  end
end
