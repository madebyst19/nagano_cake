Rails.application.routes.draw do
  get 'address/index'
  get 'address/create'
  get 'address/new'
  get 'address/edit'
  get 'address/show'
  get 'address/update'
  get 'address/destroy'
  get 'customers/index'
  get 'customers/create'
  get 'customers/new'
  get 'customers/edit'
  get 'customers/show'
  get 'customers/update'
  get 'customers/destroy'
  devise_for :customers
  namespace :admins  do
    resources :customers
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
