require "application_system_test_case"

class CategoriesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit "/"
    assert_selector "h2", text: "Awesome Categories"
  end

  test "lets a signed in user create a new category" do
    login_as users(:george)
    visit "/categories/new"
    save_and_open_screenshot

    fill_in "category_title", with: "Le Wagon"
    save_and_open_screenshot

    click_on 'Create Category'
    # save_and_open_screenshot

    # Should be redirected to Home with new product
    assert_equal root_path, page.current_path
    assert_text "Le Wagon"
  end
end
