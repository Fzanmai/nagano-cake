class Public::OrdersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @new_order = Order.new
    #@customer = Customer.find(params[:id])
  end

  def thanx
  end

  def confirmation
    @new_order = Order.new(order_params)

    #ラジオボタンの選択肢を分岐
    if params[:order][:address_num] == "1"
      @new_order.postal_code = current_customer.post_code
      @new_order.address = current_customer.address
      @new_order.name = current_customer.first_name
    elsif params[:order][:address_number] == "2"
      @new_order.postal_code = "1111234"
      @new_order.name = "配送先の宛名"
    elsif params[:order][:address_number] == "3"
    end

    #@cart_items = current_customer.cart_items.all
  end

  def create
    @new_order = Order.new(order_params)

    if @new_order.save
      redirect_to thanx_orders_path
    else
      redirect_to new_order_path
    end

  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :address, :first_name, :last_name, :postal_code, :name)
  end

end
