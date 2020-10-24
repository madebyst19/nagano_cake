class Admins::CustomersController < ApplicationController
    def index
        @customers = Customer.all
        # if customer.is_deleted = true
        #     customer.is_deleted ='有効'
        # else customer.is_deleted = false
        #     customer.is_deleted ='無効'
        # end
    end

    def edit
        @customer = Customer.find(params[:id])
    end

    def show
        @customer = Customer.find(params[:id])
    end

    def update
        @customer = Customer.find(params[:id])
            if @customer.update(customer_params)
            redirect_to admins_customer_path(@customer)
            else
            render "edit"
            end
    end

    private
    def customer_params
    params.require(:customer).permit(:first_name,:last_name,:first_name_kana,:last_name_kana,:postal_code,:address,:telephone_number,:email,:is_deleted)
    end
end
