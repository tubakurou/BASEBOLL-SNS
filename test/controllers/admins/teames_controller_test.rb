require 'test_helper'

class Admins::TeamesControllerTest < ActionDispatch::IntegrationTest
  test "should get resources" do
    get admins_teames_resources_url
    assert_response :success
  end

end
