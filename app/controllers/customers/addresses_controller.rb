class Customers::AddressesController < ApplicationController
    before_action :authenticate_customer! 
    def index
        @address = current_customer.addresses.new
        @addresses = Address.where(customer_id: current_customer.id)
        
    end

    def create
        @address = current_customer.addresses.new(address_params)
        @address.customer_id = current_customer.id
        if @address.save
        redirect_to customers_addresses_path(current_customer)
        else
            flash[:notice] = "登録に失敗しました。."
            render "index"
        end
    end

    def new
    end

    def edit
        @address = Address.find(params[:id])
    end

    def show
    end
    
    def update
        @address = Address.find(params[:id])
        if @address.update(address_params)
          redirect_to customers_addresses_path(@address.id)
        else
            @address = current_customer.addresses.new
            @addresses =  current_customer.addresses
          render 'index'
        end
    end
    
    def destroy
        @address = Address.find(params[:id])
        @address.destroy
       redirect_to customers_addresses_path

    end
    private
    def address_params
        params.require(:address).permit(:id,:postal_code, :address, :name)
    end
    end
