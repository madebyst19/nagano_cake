class Admins::ItemsController < ApplicationController
    before_action :authenticate_admin!
    def index
        @items = Item.all

    end

    def edit
        @item = Item.find(params[:id])
        @genres = Genre.all
    end

    def create
        @item = Item.new(item_params)
        if item_params[:is_active] == '有効'
            @item.is_active = true
        elsif item_params[:is_active] == '無効'
            @item.is_active = false
        end

        if @item.save
            redirect_to admins_item_path(@item.id)
        else
            render new_admins_item_path
        end
    end

    def new
        @item = Item.new
        @genres = Genre.all
    end

    def show
        @item = Item.find(params[:id])
    end

    def update
        @item = Item.find(params[:id])
        @genres = Genre.find(params[:id])
        if @item.update(item_params)
            redirect_to admins_item_path(@item.id)
          else
            render "edit"
          end
    end
    private
    def item_params
        params.require(:item).permit(:name, :genre_id , :image, :introduction, :price, :is_active)
    end
end