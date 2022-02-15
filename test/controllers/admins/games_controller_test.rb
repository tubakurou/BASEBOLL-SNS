require 'test_helper'

class Admins::GamesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_games_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_games_show_url
    assert_response :success
  end

  test "should get edit" do
    get admins_games_edit_url
    assert_response :success
  end

  test "should get create" do
    get admins_games_create_url
    assert_response :success
  end

end
