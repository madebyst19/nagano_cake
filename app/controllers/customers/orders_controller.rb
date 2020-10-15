class Customers::OrdersController < ApplicationController
    before_action :authenticate_customer!
    
    def index
    end

    def create
         @order = current_customer.orders.new(order_create_params)
         @order.status = 0
         if @order.save
            @cart_items = current_customer.cart_items
            @cart_items.each do |cart_item|
               @order_details = @order.order_details.new
               @order_details.item_id = cart_item.item.id
               @order_details.price = cart_item.item.price * $tax
               @order_details.amount = cart_item.amount
               @order_details.making_status = 0
               @order_details.save
            end
             current_customer.cart_items.destroy_all
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
        @order = current_customer.orders.new
        @name = current_customer.first_name + current_customer.last_name
        @cart_items = current_customer.cart_items
        @order_payment = params[:order][:payment_method]
        @address_option = params[:order][:address_option]
        # @status = params[:order][:status]

        # if order_params[:status] == '有効'
        #     @order.status = true
        # elsif order_params[:status] == '無効'
        #     @order.status = false
        # end

        if @address_option == "0"
            @order_address = Order.new(address: current_customer.address,postal_code: current_customer.postal_code,name: current_customer.last_name + current_customer.first_name)
        elsif @address_option == "1"
            @address = Address.find(params[:order][:address_id])
            @order_address = Order.new(address: @address.address,postal_code: @address.postal_code,name: @address.name)
        elsif @address_option == "2"
            @order_address = Order.new(order_params)
        end
    end
    def count 
        
    end
    private
    def order_params
        params.require(:order).permit(:cart_item_id,:postal_code,:address,:name,:payment_method,:status,:shipping_cost,:total_payment)
      end
      def order_create_params
        params.require(:order).permit(:postal_code,:address,:name,:payment_method,:shipping_cost,:total_payment)
      end
end
