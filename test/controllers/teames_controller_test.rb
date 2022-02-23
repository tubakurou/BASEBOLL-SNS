require 'test_helper'

class TeamesControllerTest < ActionDispatch::IntegrationTest
  test "should get inex" do
    get teames_inex_url
    assert_response :success
  end

  test "should get show" do
    get teames_show_url
    assert_response :success
  end

  test "should get create" do
    get teames_create_url
    assert_response :success
  end

  test "should get edit" do
    get teames_edit_url
    assert_response :success
  end

end
