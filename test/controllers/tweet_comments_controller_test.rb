require 'test_helper'

class TweetCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get tweet_comments_create_url
    assert_response :success
  end

end
