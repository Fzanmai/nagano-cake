class Public::OrdersController < ApplicationController
  def index
    @orders = Order.where(customer_id: current_customer.id).page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @new_order = Order.new
    @shipping_addresses = ShippingAddress.where(customer_id: current_customer.id)
  end

  def thanx
  end

  def confirmation
    @new_order = Order.new(order_params)

    #ラジオボタンの選択肢を分岐
    if params[:order][:address_num] == "1"
      @new_order.postal_code = current_customer.post_code
      @new_order.address = current_customer.address
      @new_order.name = current_customer.last_and_first_name
    elsif params[:order][:address_num] == "2"
      @shipping_addresses_id = ShippingAddress.find(params[:order][:registered_addresses])
      @new_order.postal_code = @shipping_addresses_id.post_code
      @new_order.address = @shipping_addresses_id.address
      @new_order.name = @shipping_addresses_id.name
    elsif params[:order][:address_num] == "3"
    end

    #@cart_items = current_customer.cart_items.all
  end

  def create
    @new_order = Order.new(order_params)
    @new_order.customer_id = current_customer.id #customer_idはFKなので必須項目だが、new,confirmationのviewでは設定していないためここで設定。
    if @new_order.save
      redirect_to thanx_orders_path
    else
      render :confirmation
    end
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :address, :first_name, :last_name, :postal_code, :name)
  end

end
