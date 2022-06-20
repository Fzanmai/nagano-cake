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
  end

  def create
    @new_order = Order.new(order_params)
    @new_order.save
    redirect_to thanx_orders_path
  end

  private

  def order_params
    params.require(:order).permit(:payment_method)
  end

end
