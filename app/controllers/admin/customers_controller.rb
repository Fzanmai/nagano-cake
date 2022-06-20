class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
    if @customer == current_user
      render :edit
    else
      redirect_to admin_customer_path(current_customer.id)
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:email, :password, :last_name, :first_name, :last_name_kana, :first_name_kana, :phone_number,:post_code, :address, :is_deleted)
  end

end
