class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    @order = Order.find(params[:order_detail][:order_id])
    order_production_status = @order.production_status #今の注文ステータスをローカル変数に保存
    if @order_detail.order_status == "under_manufacture"
      @order.update(production_status: "under_manufacture")
    else
      @order_details = @order.order_details
      @order_details.each do |order_detail|
        if order_detail.order_status == "finish"
          @order.production_status = "on_shipping"
        else #注文詳細の全ての製作ステータスが『製作完了』でない時、注文ステータスに今と同じものを代入し、eachを抜ける。
          @order.production_status = order_production_status
          break
        end
      end
      @order.update(production_status: @order.production_status)
    end
    redirect_to admin_order_path(params[:order_detail][:order_id])
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:order_status)
  end

end
