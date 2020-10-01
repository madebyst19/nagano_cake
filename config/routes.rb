Rails.application.routes.draw do
  devise_scope :customer do
    get "customers/sign_in" => "customers/sessions#new"
    post "customers/sign_in" => "customers/sessions#create"
    delete "customers/sign_out" => "customers/sessions#destroy"
    get "customers/sign_up" => "customers/registrations#new"
    post "customers" => "customers/registrations#create"
  end
    devise_scope :admin do
    get "admins/sign_in" => "admins/sessions#new"
    post "admins/sign_in" => "admins/sessions#create"
    delete "admins/sign_out" => "admins/sessions#destroy"
    get "admins/sign_up" => "admins/registrations#new"
    post "admins" => "admins/registrations#create"
  end
  devise_for :customers, skip: :all
  devise_for :admins
  get 'home/about'
  get 'home/top'
  get 'admins/top'
  get 'customers/order_confirm'
  get 'customers/order_finish'

  namespace :admins  do
    resources :addresses, only:[:index,:new,:show,:edit,:update,:create]
    resources :customers, only:[:index,:show,:edit,:update]
    resources :items, only:[:index,:new,:show,:edit,:update,:create]
    resources :genrea, only:[:index,:new,:edit,:create,:update]
    resources :order_details, only:[:index,:show,:edit,:update]
  end

  namespace :customers  do
    resources :addresses, only:[:index,:new,:show,:edit,:update,:create]
    resources :cart_items, only:[:new,:show,:edit,:update,:create]
    resources :items, only:[:index,:show]
    resources :orders, only:[:show,:edit,:update,:create]
    resources :order_details, only:[:index,:show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
