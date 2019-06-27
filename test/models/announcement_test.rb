require 'test_helper'

class AnnouncementTest < ActiveSupport::TestCase
  def setup
    @user = users(:kendra)
    @announcement = @user.announcements.build(content: "Lorem ipsum")
  end

  test "should be valid" do
    assert @announcement.valid?
  end

  test "user id should be present" do
    @announcement.user_id = nil
    assert_not @announcement.valid?
  end

  test "content should be present" do
    @announcement.content = "   "
    assert_not @announcement.valid?
  end

  test "order should be most recent first" do
    assert_equal announcements(:most_recent), Announcement.first
  end
end
