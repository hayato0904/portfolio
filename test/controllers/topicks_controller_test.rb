require 'test_helper'

class TopicksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get topicks_index_url
    assert_response :success
  end

end
