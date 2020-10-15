class Admins::OrdersController < ApplicationController
    def count
        @order = Order.all
    end
    def index
        @orders = Order.all
    end

    def update
        @order = Order.find(params[:id])
        if @order.update(status: order_params[:status].to_i)
          redirect_to admins_orders_path
        else
          render 'edit'
        end
    end

    private
    def order_params
        params.require(:order).permit(:status)
    end
end