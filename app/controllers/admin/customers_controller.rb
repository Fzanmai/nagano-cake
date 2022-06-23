class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def check
    @customer = Customer.find(params[:id])
　end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
  end

  private
    def customer_params
      params.require(:customer).permit(:email, :password, :last_name, :first_name, :last_name_kana, :first_name_kana, :phone_number, :post_code, :address, :is_deleted)
    end

  end

end
