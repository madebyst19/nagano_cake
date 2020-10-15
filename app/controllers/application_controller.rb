class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
    protect_from_forgery with: :null_session 
        helper_method :current_cart_item
        def after_sign_in_path_for(resource)
          case resource
          when Admin
            admins_admins_path
          when Customer
            root_path
          end
        end


    $tax = 1.08
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:telephone_number])
    end
end
