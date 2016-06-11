require "rails_helper"

RSpec.feature "User can adjust item quantites in cart" do
#   Background: My cart has an item in it
# As a visitor
# When I visit "/cart"
# Then I should see my item with a quantity of 1
# And when I increase the quantity
# Then my current page should be '/cart'
# And that item's quantity should reflect the increase
# And the subtotal for that item should increase
# And the total for the cart should match that increase
# And when I decrease the quantity
# Then my current page should be '/cart'
# And that item's quantity should reflect the decrease
# And the subtotal for that item should decrease
# And the total for the cart should match that decrease
  scenario "user increases quantity" do
    item = FactoryGirl.create(:item)
    # cart = {"#{item.id}"=>1},  session[:cart] = cart, HOW DO I STUB session

    visit item_path(item)
    click_link "Add to cart"

    visit '/cart'

    expect(current_path).to eq("/cart")
    expect(page).to have_content item.title
    expect(page).to have_content "Quantity: 1"

    click_button ("Quantity")
    click_on "2"

    expect(page).to have_content "Quantity: 2"

    click_button ("Quantity")
    click_on "4"

    expect(page).to have_content "Quantity: 4"
  end
end
