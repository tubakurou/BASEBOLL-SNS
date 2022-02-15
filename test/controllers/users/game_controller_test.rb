require 'test_helper'

class Users::GameControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get users_game_show_url
    assert_response :success
  end

  test "should get index" do
    get users_game_index_url
    assert_response :success
  end

end
