require 'test_helper'

class Users::TeamesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_teames_index_url
    assert_response :success
  end

end
