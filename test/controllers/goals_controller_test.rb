require 'test_helper'

class GoalsControllerTest < ActionDispatch::IntegrationTest
  test "should get home:index" do
    get goals_home:index_url
    assert_response :success
  end

end
