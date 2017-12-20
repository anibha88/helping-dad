require 'test_helper'

class StoryMailerTest < ActionMailer::TestCase
  test "daily_story" do
    mail = StoryMailer.daily_story
    assert_equal "Daily story", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
