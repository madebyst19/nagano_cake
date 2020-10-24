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
            if params[:order][:status] == "1"
                @order.order_details.each do |order_detail|
                    order_detail.making_status = 1
                    order_detail.save
                end
            end
          redirect_to edit_admins_order_detail_path(@order)
        else
          render 'index'
        end
    end

    private
    def order_params
        params.require(:order).permit(:status)
    end
end