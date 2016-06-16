require 'rails_helper'

RSpec.feature "admin can delete an order" do
  scenario "admin deletes an existing order" do
    admin = FactoryGirl.create(:user, role: 1)
    item = FactoryGirl.create(:item)
    order = FactoryGirl.create(:order, status: "completed", user_id: admin.id)
    order_items = OrderItem.create(item_id: item.id, order_id: order.id, quantity: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_order_path(order.id)

    expect(page).to have_content ("#{order.id}")
    expect(order.status).to eq("completed")
save_and_open_page
    select "cancelled", :from => :order_status

    expect(order.status).to eq(:cancelled)
  end
end
