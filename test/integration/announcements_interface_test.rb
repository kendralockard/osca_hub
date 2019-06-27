require 'test_helper'

class AnnouncementsInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:kendra)
  end

  test "announcement interface" do
    log_in_as(@user)
    get root_path
    assert_select 'div.pagination'
    # Invalid submission
    assert_no_difference 'Announcement.count' do
      post announcements_path, params: { announcement: { content: "" } }
    end
    assert_select 'div#error_explanation'
    # Valid submission
    content = "This announcement really ties the room together"
    assert_difference 'Announcement.count', 1 do
      post announcements_path, params: { announcement: { content: content } }
    end
    assert_redirected_to root_url
    follow_redirect!
    assert_match content, response.body
    # Delete post
    assert_select 'a', text: 'OSCA Hub'
    first_announcement = @user.announcements.paginate(page: 1).first
    assert_difference 'Announcement.count', -1 do
      delete announcement_path(first_announcement)
    end
    # Visit different user (no delete links)
    get user_path(users(:julie))
    assert_select 'a', text: 'OSCA Hub', count: 1  #?
  end
end
