require 'test_helper'

class Admins::TeamControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_team_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_team_show_url
    assert_response :success
  end

  test "should get create" do
    get admins_team_create_url
    assert_response :success
  end

  test "should get edit" do
    get admins_team_edit_url
    assert_response :success
  end

  test "should get update" do
    get admins_team_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admins_team_destroy_url
    assert_response :success
  end

end
