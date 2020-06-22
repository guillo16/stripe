require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @category = categories(:backpack)
  end
 test "lets a signed in user create a new product_title" do
  login_as users(:george)
  visit "/products/new"
    # save_and_open_screenshot
    puts @category

    fill_in "product_title", with: "Le Wagon"
    fill_in "product_photo", with: "Le Wagon"
    fill_in "product_description", with: 'Something'
    fill_in 'category_id', with: @category

    click_on 'Create Product'


    # Should be redirected category show
    assert_equal products_path, page.current_path
    assert_text "Le Wagon"
  end
end
