require 'test_helper'

class Users::PlayersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_players_index_url
    assert_response :success
  end

  test "should get show" do
    get users_players_show_url
    assert_response :success
  end

  test "should get create" do
    get users_players_create_url
    assert_response :success
  end

  test "should get edit" do
    get users_players_edit_url
    assert_response :success
  end

  test "should get update" do
    get users_players_update_url
    assert_response :success
  end

  test "should get destroy" do
    get users_players_destroy_url
    assert_response :success
  end

end
