require 'test_helper'

class MenuTest < ActiveSupport::TestCase
  def setup
    @user = users(:kendra)
    @menu = @user.menus.build(content: "Lentils")
  end

  test "should be valid" do
    assert @menu.valid?
  end

  test "user id should be present" do
    @menu.user_id = nil
    assert_not @menu.valid?
  end

  test "content should be present" do
    @menu.content = "   "
    assert_not @menu.valid?
  end

  test "order should be most recent first" do
    assert_equal menus(:most_recent), Menu.first
  end
end
