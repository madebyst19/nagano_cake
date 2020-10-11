class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
    # protect_from_forgery with: :null_session 
        helper_method :current_cart_item
    $tax = 1.08
   @customer = current_customer
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:telephone_number])
    end
end
