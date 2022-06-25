class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    redirect_to admin_order_path(params[:order_detail][:order_id])
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:order_status)
  end

end
