class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
  end

  def withdrawal
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  def active_for_authentication?
    super && (is_deleted == false)
  end


  def edit
    @customer = Customer.find(params[:id])
    if @customer == current_customer
      render :edit
    else
      redirect_to customer_path(current_customer.id)
    end
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path(current_customer.id), notice: "You have updated user successfully."
    else
      render "customers/edit"
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:email, :password, :last_name, :first_name, :last_name_kana, :first_name_kana, :phone_number,:post_code, :address, :is_deleted)
  end

  def ensure_correct_customer
    @customer = Customer.find(params[:id])
    unless @customer == current_customer
      redirect_to customer_path(current_customer)
    end
  end

end
