Rails.application.routes.draw do
  devise_for :customers, skip: :all
  devise_for :admins
  root 'home#top'
  get "home/about" => "home/about#about"

  namespace :customers  do
    resources :items, only:[:index,:show,:top]
    delete "cart_items/delete_all" => "cart_items#delete_all"
    resources :cart_items, only:[:index,:update,:destroy,:create]
  
  end

  devise_scope :customer do
    get "customers/sign_in" => "customers/sessions#new"
    post "customers/sign_in" => "customers/sessions#create"
    delete "customers/sign_out" => "customers/sessions#destroy"
    get "customers/sign_up" => "customers/registrations#new"
    post "customers" => "customers/registrations#create"
    get "customers_my_page" => "customers/#show"
    get "customers_edit" => "customers/edit#edit"
    patch "customers" => "customers/update#update"
    get "customers_unsubscribe" => "customers/unsubscribe#unsubscribe"
    patch "costomers_withdraw" => "customers/withdraw#withdraw"
  end
  
 
  resources :addresses, only:[:index,:new,:show,:edit,:update,:create]
  resources :orders, only:[:new,:confirm,:complete,:create,:index,:show]

    devise_scope :admin do
    get "admins/sign_in" => "admins/sessions#new"
    post "admins/sign_in" => "admins/sessions#create"
    delete "admins/sign_out" => "admins/sessions#destroy"
  end

  get "admins/" => "admin/top#top"
  namespace :admins  do
    resources :items, only:[:index,:new,:show,:edit,:update,:create]
    resources :genres, only:[:index,:edit,:create,:update]
    resources :customers, only:[:index,:show,:edit,:update]
    resources :orders, only:[:index,:show,:update]
    resources :order_details, only:[:update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
