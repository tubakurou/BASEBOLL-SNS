require 'test_helper'

class Admins::CardsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get admins_cards_update_url
    assert_response :success
  end

end
