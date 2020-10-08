class Admins::AddressesController < ApplicationController
    before_action :authenticate_user! 
end
