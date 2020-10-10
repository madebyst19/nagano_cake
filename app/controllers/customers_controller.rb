class CustomersController < ApplicationController
  
  def show
    @customer = current_customer
  end
  
  def edit
    @customer = current_customer
  end
  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_my_page_path
    else
      render 'update'
    end
    @customer_delete = Customer.find(params.id)
    @customer_delete.destroy
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:first_name_kana,:last_name_kana,:email,:encrypted_password,:reset_password_token,:postal_code,:address,:telephone_number)
  end
end
