require 'test_helper'

class AnnouncementsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @announcement = announcements(:orange)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Announcement.count' do
      post announcements_path, params: { announcement: { content: "Lorem ipsum" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Announcement.count' do
      delete announcement_path(@announcement)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong micropost" do
    log_in_as(users(:kendra))
    announcement = announcements(:ants)
    assert_no_difference 'Announcement.count' do
      delete announcement_path(announcement)
    end
    assert_redirected_to root_url
  end
end
