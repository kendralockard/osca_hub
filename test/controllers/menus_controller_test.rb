require 'test_helper'

class MenusControllerTest < ActionDispatch::IntegrationTest
  def setup
    @menu = menus(:lunch)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Menu.count' do
      post menus_path, params: { menu: {
        starch: "Rice",
        protein: "Lentils",
        vegetable: "Corn",
        restrictions: "Tofu"
       } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Menu.count' do
      delete menu_path(@menu)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong menu" do
    log_in_as(users(:kendra))
    menu = menus(:ants)
    assert_no_difference 'Menu.count' do
      delete menu_path(menu)
    end
  end
end
