class Admins::OrderDetailsController < ApplicationController
    def edit
        @order = Order.find(params[:id])
        @customer = Customer.find(@order.customer_id)
        @order_details = OrderDetail.where(order_id:@order.id)
    end
    def update
        @order_detail = OrderDetail.find(params[:id])
        if @order_detail.update(making_status: order_detail_params[:making_status].to_i)
          redirect_to edit_admins_order_detail_path(@order_detail.order_id)
        else
          render 'edit'
        end
    end
    private
    def order_detail_params
        params.require(:order_detail).permit(:making_status)
    end
end
