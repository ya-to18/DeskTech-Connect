require "test_helper"

class MyPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_pages_index_url
    assert_response :success
  end
end
