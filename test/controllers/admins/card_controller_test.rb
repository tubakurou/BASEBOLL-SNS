require 'test_helper'

class Admins::CardControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get admins_card_update_url
    assert_response :success
  end

end
