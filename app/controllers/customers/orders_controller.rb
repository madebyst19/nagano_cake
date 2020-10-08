class Customers::OrdersController < ApplicationController
    before_action :authenticate_customer!
    
    def index
    

    end

    def create
        @order = current_customer.id
        if @order.save
            redirect_to customers_orders_confirm_path
        else
            @order = current_customer.id
            render "new"
        end
    end

    def new
        @order = Order.new


     
    end

    def edit
    end

    def show
    end

    def upddate
    end

    def destroy
    end

    def confirm
        @cart_items = current_customer.cart_items
        @order_payment = params[:order][:payment_method]
        @order_payment.save
        @order_address = params[:order][:address_option]
        @order_address.save
    end

    def order_params
        params.require(:order).permit(:cart_item_id)
      end
end
