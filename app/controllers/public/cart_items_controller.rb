class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
  end

  def create
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
      @cart_items = current_customer.cart_items
      @cart_items.each do |cart_item|
      if @cart_item.item_id == cart_item.item_id
        @cart_item_total = cart_item.quantity + @cart_item.quantity
        cart_item.update_attribute(:quantity, @cart_item_total)
        @cart_item.delete
      end
      end
      @cart_item.save
      redirect_to cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to cart_items_path, notice: "You have updated book successfully."
    else
      render "index"
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def all_destroy
    cart_items = CartItem.all
    cart_items.destroy_all
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id,:quantity)
  end

end
