require 'test_helper'

class Admins::TeamsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_teams_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_teams_show_url
    assert_response :success
  end

  test "should get create" do
    get admins_teams_create_url
    assert_response :success
  end

  test "should get edit" do
    get admins_teams_edit_url
    assert_response :success
  end

  test "should get update" do
    get admins_teams_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admins_teams_destroy_url
    assert_response :success
  end

end
