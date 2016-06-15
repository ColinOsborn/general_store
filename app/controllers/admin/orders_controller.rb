class Admin::OrdersController < Admin::BaseController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order = Order.update(order_params)
    if order.update(order_params)
      redirect_to order_path(order)
    else
      flash[:warning] = "Order cannot be updated"
    end
  end

  def destory
    @order = Order.find(params[:id])

    @cart.cart_items.each do |cart_item|
      cart_item_id = cart_item.id
      item = Item.find(cart_item_id)
      item.stock = item.stock + cart_item.quantity.to_i
      item.save

    @order.destroy
    redirect_to orders_path
  end

  private

  def order_params
    permit.require(:order).params([:status])
  end

end
