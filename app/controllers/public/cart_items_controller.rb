class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
  end

  def create
    @new_cart_item = CartItem.new(cart_item_params)
    @new_cart_item.customer_id = current_customer.id
    @new_cart_item.save
    @item = Item.find(cart_item_params[:item_id])
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(cart_item_params)
    @cart_item.destroy
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id,:quantity)
  end

end
