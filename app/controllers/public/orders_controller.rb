class Public::OrdersController < ApplicationController
  def index
    @orders = Order.where(customer_id: current_customer.id).page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total = @order_details.inject(0) { |sum, order_detail| sum + order_detail.total }
  end

  def new
    @new_order = Order.new
    @shipping_addresses = ShippingAddress.where(customer_id: current_customer.id)
  end

  def thanx
  end

  def confirmation
    @new_order = Order.new(order_params)
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }

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
    cart_items = CartItem.where(customer_id: current_customer.id)#cart_itemsにログイン顧客が作成したカート情報を全て持たせる。
    if @new_order.save
      cart_items.each do |cart| #繰り返し、カートアイテムの内容を注文詳細にsaveする。
        order_detail = OrderDetail.new #箱を作成
        order_detail.item_id = cart.item_id
        order_detail.price = cart.item.price #単価をitemから取得。
        order_detail.quantity = cart.quantity
        order_detail.order_id = @new_order.id
        order_detail.save
      end
      redirect_to thanx_orders_path
      cart_items.destroy_all #顧客に紐づくカート情報の全件削除
    else
      render :confirmation
    end
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :address, :first_name, :last_name, :postal_code, :name)
  end

end
