require 'test_helper'

class MenuTest < ActiveSupport::TestCase
  def setup
    @user = users(:kendra)
    @menu = @user.menus.build(
      starch: "Rice",
      protein: "Lentils",
      vegetable: "Corn",
      restrictions: "Tofu"
    )
  end

  test "should be valid" do
    assert @menu.valid?
  end

  test "user id should be present" do
    @menu.user_id = nil
    assert_not @menu.valid?
  end

  test "required fields should be present" do
    @menu.starch = "   "
    @menu.protein = "   "
    @menu.vegetable = "   "
    @menu.restrictions = "   "
    assert_not @menu.valid?
  end

  test "order should be most recent first" do
    assert_equal menus(:most_recent), Menu.first
  end
end
