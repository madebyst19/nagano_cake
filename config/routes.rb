Rails.application.routes.draw do
  get 'admins/top'
  get 'customers/show'
  devise_for :customers, skip: :all

  root 'customers/items#index'
  get "home/about" => "home/about#about"

  namespace :customers  do
    resources :items, only:[:index,:show,:top]
    delete "cart_items/delete_all" => "cart_items#delete_all"
    get "orders/confirm" => "orders#confirm"
    get "orders/complete" => "orders#complete"
    resources :cart_items, only:[:index,:update,:destroy,:create]
    resources :addresses, only:[:index,:new,:show,:edit,:update,:create,:destroy]
    resources :orders, only:[:new,:create,:index,:show]
  end


  devise_scope :customer do
    get "customers_my_page" => "customers#show"
    get "customers_edit" => "customers#edit"
    patch "customers" => "customers#update"
    get "customers_unsubscribe" => "customers#unsubscribe"
    delete "customers_withdraw" => "customers#withdraw"
    devise_for :customers, controllers: {sessions: "customers/sessions", registrations: 'customers/registrations', passwords: 'customers/passwords'}
  
  end

    devise_scope :admin do
    devise_for :admins, controllers: {sessions: "admins/sessions", registrations: 'admins/registrations', passwords: 'admins/passwords'}
    get "admins/sign_in" => "admins/sessions#new"
    post "admins/sign_in" => "admins/sessions#create"
    delete "admins/sign_out" => "admins/sessions#destroy"
  end

  get "admins/" => "admin/#top"
  namespace :admins  do
    
    resources :items, only:[:index,:new,:show,:edit,:update,:create]
    resources :genres, only:[:index,:edit,:create,:update]
    resources :customers, only:[:index,:show,:edit,:update]
    resources :orders, only:[:index,:show,:update]
    resources :order_details, only:[:update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
