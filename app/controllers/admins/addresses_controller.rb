class Admins::AddressesController < ApplicationController
    before_action :authenticate_admin!
end
