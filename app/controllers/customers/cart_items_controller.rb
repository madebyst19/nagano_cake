class Customers::CartItemsController < ApplicationController
    before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]
    before_action :authenticate_customer!
    def index
      @cart_items = current_customer.cart_items
      @order = Order.new
    end

    def edit
        @item = Item.find(params[:id])
        @items = Item.all
    end

  def create
      @order = Order.new
      @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
       if @cart_item.presence
       @cart_item.amount += params[:cart_item][:amount].to_i
        @cart_item.update(amount:@cart_item.amount)
        @cart_item.save
        redirect_to customers_cart_items_path

      elsif   @cart_item = CartItem.new(cart_item_params)
              @cart_item.customer_id = current_customer.id
              @cart_item.save
              @cart_items = CartItem.all
              redirect_to customers_cart_items_path
      else
        @item = Item.find(params[:id])
        render 'customer/items/show'
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to customers_cart_items_path(@cart_item.id)
    else
      render 'edit'
    end
  end


    def destroy
     @cart_item = CartItem.find(params[:id])
     @cart_item.destroy
    redirect_to customers_cart_items_path
 end

    def delete_all
      @cart_item_all = current_customer.cart_items
      @cart_item_all.destroy_all
      redirect_to customers_items_path, notice: 'カートが空になりました。'
    end

    private 
    def cart_item_params
      params.require(:cart_item).permit(:amount,:item_id)
    end
end
