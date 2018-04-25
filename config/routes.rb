Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :stocks do
    resources :prices
  end

  get 'home/index'


  # eg. http://localhost:3000/businesses/sign_in
  devise_for :businesses, path: 'businesses', controllers: {
    sessions: 'businesses/sessions'
  }
  
  resources :businesses


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
