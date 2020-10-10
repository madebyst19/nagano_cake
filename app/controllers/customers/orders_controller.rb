class Customers::OrdersController < ApplicationController
    before_action :authenticate_customer!
    
    def index
    

    end

    def create
        @order = current_customer.orders.new
        @order.payment_method = params[:payment_method]
        @order.address = params[:address]
        @order.name = params[:name]
        @order.shipping_cost = params[:shipping_cost]
        @order.total_payment = params[:total_payment]
        @order.status = params[:status]
        if @order.save
            current_customer.cart_items.destroy
            redirect_to  customers_orders_complete_path
            else
                render "confirm"
        end
      
    end

    def new
        @order = Order.new


     
    end

    def edit
    end

    def show
        @orders = current_customer.orders
        @cart_items = current_customer.cart_items
    end

    def upddate
    end

    def destroy
    end

    def confirm
        
        @name = (current_customer.first_name) + (current_customer.last_name)
        @cart_items = current_customer.cart_items
        @order_payment = params[:order][:payment_method]
        @address_option = params[:order][:address_option]
        if @address_option == "0"
            @order_address = Order.new(address: current_customer.address,postal_code: current_customer.postal_code,name: current_customer.last_name + current_customer.first_name)
        elsif @address_option == "1"
            @address = Address.find(params[:order][:address_id])
            @order_address = Order.new(address: @address.address,postal_code: @address.postal_code,name: @address.name)
        elsif @address_option == "2"
            @order_address = Order.new(order_params)
        end
        

    end
 private
    def order_params
        params.require(:order).permit(:cart_item_id,:postal_code,:address,:name,:payment_method,:staus,:shipping_cost,:total_payment)
      end
end
