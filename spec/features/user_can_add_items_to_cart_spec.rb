require 'rails_helper'

RSpec.feature "User can add an item to their cart" do
  scenario "user adds items to their carts" do
    item = FactoryGirl.create(:item)

    visit item_path(item)
    click_link "Add to cart"
    expect(current_path).to eq(item_path(item))
    expect(page).to have_content "#{item.title} has been added to cart."
    expect(current_path).to eq(item_path(item))

    click_link "View Cart"

    expect(current_path).to eq("/cart")
    expect(page).to have_content("#{item.title}")
    expect(page).to have_content("#{item.description}")
    expect(page).to have_content("#{item.price}")
    expect(page).to have_content("#{item.weight}")
    expect(page).to have_content("Price Total: #{item.price}")
    expect(page).to have_content("Weight Total: #{item.weight}")

# As a visitor
# When I visit any page with an item on it
# I should see a link or button for "Add to Cart"
# When I click "Add to cart" for that item
# And I click a link or button to view cart
# And my current path should be "/cart"
# And I should see a small image, title, description and price for the item I just added
# And there should be a "total" price for the cart that should be the sum of all items in the cart
  end
end
