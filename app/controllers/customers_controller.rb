class CustomersController < ApplicationController
  def show
    @customer = current_customer.id
  end
end
