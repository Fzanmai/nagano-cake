class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.find(params[:id])
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end

end
