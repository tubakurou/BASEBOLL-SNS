require 'test_helper'

class Users::RelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get followings" do
    get users_relationships_followings_url
    assert_response :success
  end

  test "should get followerskill" do
    get users_relationships_followerskill_url
    assert_response :success
  end

end
