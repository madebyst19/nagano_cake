class Customers::ItemsController < ApplicationController

    def index
        @items = Item.all
        @genres = Genre.all
    end
    def create

    end

    def new
    end

    def edit
    end

    def show
        @item = Item.find(params[:id])
        @cart_item = CartItem.new
        @genres = Genre.all
    end
    
    def upddate
    end

    def destroy
    end
end
