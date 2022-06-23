class Public::ShippingAddressesController < ApplicationController

  def new
    @shipping_address_new = ShippingAddress.new
  end

  def index
    @shipping_addresses = ShippingAddress.all
    @Shipping_address = ShippingAddress.new
  end

  def edit
    @shipping_address = ShippingAddress.find(params[:id])
    if @shipping_address.customer == current_customer
      render :edit
    else
      redirect_to customers_path
    end
  end

  def update
    @shipping_address = ShippingAddress.find(params[:id])
    if @shipping_address.update(shipping_address_params)
      redirect_to shipping_addresses_path, notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

 def create
    @address = ShippingAddress.new(shipping_address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to shipping_addresses_path, notice: "You have created book successfully."
    else
      @shipping_address = ShippingAddress.all
      render 'index'
    end
 end

 def destroy
    @shipping_address = ShippingAddress.find(params[:id])
    @shipping_address.destroy
    redirect_to shipping_addresses_path
 end

  private

  def shipping_address_params
    params.require(:shipping_address).permit(:name, :post_code, :address)
  end


end
