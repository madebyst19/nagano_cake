class CartItem < ApplicationRecord
    belongs_to :customer
    belongs_to :item

    def delete_item(item)
        current_item = @items.find {|item| item.product == product }
        if current_item.decrement_quantity == 0
          @items.delete(current_item)
        end
        current_item
      end
      def sum
        @sum = [cart_item.item.price*1.08*(cart_item.amount)]+[cart_item.item.price*1.08*(cart_item.amount)]
      end
end
