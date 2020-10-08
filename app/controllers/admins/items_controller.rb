class Admins::ItemsController < ApplicationController
    before_action :authenticate_user! 
    def index
    @items = Item.all
        
    end
    
    def create
    @item = Item.new(item_params)
    if @item.save
        redirect_to admins_item_path
    else
        render new_admins_item_path
        end
    end

    def new
        
    end
    def edit
        
    end
    def show
        
    end
    def update
        
    end

end

private
      def item_params
        params.require(:item).permit(:name, :genre_id , :image_id, :introduction, :price, :is_active)
      end