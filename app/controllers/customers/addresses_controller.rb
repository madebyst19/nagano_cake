class Customers::AddressesController < ApplicationController
    before_action :authenticate_customer! 
    def index
        @address = current_customer.addresses.new
        @addresses =  current_customer.addresses
       
        
    end

    def create
        @address = current_customer.addresses.new(address_params)
        if @address.save
        redirect_to customers_addresses_path
        else
            render "new"
        end
    end

    def new
    end

    def edit
    end

    def show
    end
    
    def upddate
    end

    def destroy
    end
    private
    def address_params
        params.require(:address).permit(:postal_code, :address, :name)
    end
    end
