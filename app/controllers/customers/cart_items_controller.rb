class Customers::CartItemsController < ApplicationController
    before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]
    def index
      @cart_items = CartItem.all
  
    end

    def edit
        @item = Item.find(params[:id])
        @items = Item.all
    end

    def create
      @cart_items = CartItem.new(cart_item_params)
      @cart_items.customer_id = current_customer.id
      if @cart_items.save
        @cart_items = CartItem.all
        redirect_to customers_cart_items_path
      else
        @cart_item = CartItem.all
        @items = Item.all
        render 'customers/items/index'

      end
    end
    def show
    end
    
    def upddate
    end

    def destroy
    end
    private 
    def cart_item_params
      params.require(:cart_item).permit(:amount,:item_id)
    end
end
