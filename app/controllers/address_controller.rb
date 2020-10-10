class AddressController < ApplicationController
  def index
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to customers_my_page_path
    else
      render "index"
    end
    @addresses = current_customer.addresses
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
  end

  def update
      @address = Address.find(params[:id])
      if @address.update(address_params)
        redirect_to customers_address_path(@address.id)
      else
        render 'edit'
      end
    end
  end

  def destroy
    address = current_customer.address
    address.destroy
    redirect_to "index"
  end
  private
  def address_params
    params.require(:cart_item).permit(:postal_code,:address,:name)
  end
end
