# Background: My cart has an item in it
# As a visitor
# When I visit "/cart"
# And I click link "Remove"
# Then my current page should be "/cart"
# And I should see a message styled in green
# And the message should say "Successfully removed SOME_ITEM from your cart."
# And the title "SOME_ITEM" should be a link to that item in case the user wants to add it back
# And I should not see the item listed in cart

require 'rails_helper'

RSpec.feature "user can remove an item from the cart" do
  scenario "user can remove an item from the cart" do
    item = FactoryGirl.create(:item)
    visit item_path(item)
    click_link "Add to cart"
    visit '/cart'
    click_link "Remove"

    save_and_open_page
    expect(page).to have_content("Successfully removed #{item.title} from your cart")
    expect(page).to_not have_content("#{item.price}")
    expect(page).to_not have_content("#{item.description}")



    click_link "#{item.title}"
    expect(current_path).to eq(item_path(item))
  end
end
