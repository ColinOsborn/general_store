class CartController < ApplicationController
  def create
    @item = Item.find(params[:id])
    @cart.add_item(@item.id)
    session[:cart] = @cart.contents
    flash[:success] = "#{@item.title} has been added to cart."
    redirect_to item_path(@item)
  end

  def show
    if @cart.nil?
      flash[:no_items] = "Your cart is currently empty"
    else
      @item_ids = @cart.contents.keys
      @items = Item.where(id: @item_ids)
    end
  end

  def update
    # byebug
    item_id = params[:id]
    quantity = params[:quantity]
    @cart.update_quantity(item_id, quantity)
    @cart = session[:cart]
    redirect_to '/cart'
  end

  def change_quantity
    session[:cart][item_id] = params[:id][:quantity]
  end
end
