class Customers::AddressesController < ApplicationController
    before_action :authenticate_customer! 
    def index
   
        @addresses =  current_customer.addresses
       
        
    end

    def create
        @address = current_customer.addresses.new(address_params)
        @address.save
        redirect_to customers_addresses_path
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
        params.require(:address).permit(:postal_code,:address,:name)
    end
    end
