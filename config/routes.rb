Rails.application.routes.draw do
  resources :stocks do
    resources :prices
  end

  get 'home/index'

  # eg. http://localhost:3000/admins/sign_in
	devise_for :admins, path: 'admins', controllers: {
		sessions: 'admins/sessions'
	}
  # eg. http://localhost:3000/businesses/sign_in
	devise_for :businesses, path: 'businesses', controllers: {
			sessions: 'businesses/sessions'
	}

	# namespace :admin do
	resources :admins, :businesses
	# end

	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root 'home#index'
end
