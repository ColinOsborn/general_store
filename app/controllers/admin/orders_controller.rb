class Admin::OrdersController < Admin::BaseController
  def index
    @orders = Order.all
  end

  def show
  end
end
