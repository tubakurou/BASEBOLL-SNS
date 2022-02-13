require 'test_helper'

class Admin::TeamesControllerTest < ActionDispatch::IntegrationTest
  test "should get indeax" do
    get admin_teames_indeax_url
    assert_response :success
  end

  test "should get new" do
    get admin_teames_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_teames_create_url
    assert_response :success
  end

  test "should get show" do
    get admin_teames_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_teames_edit_url
    assert_response :success
  end

  test "should get delete" do
    get admin_teames_delete_url
    assert_response :success
  end

  test "should get update" do
    get admin_teames_update_url
    assert_response :success
  end

end
