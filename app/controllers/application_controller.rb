class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_cart_item
    $tax = 1.08
    def current_cart
      if session[:cart_item_id]
        @cart = Cart.find(session[:cart_item_id])
      else
        @cart = Cart.create
        session[:cart_item_id] = @cart.id
      end
    end
end
