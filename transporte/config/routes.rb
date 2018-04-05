Rails.application.routes.draw do
  
  resources :demands
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: {format: 'json'} do
  	resources :demands, only: [:index, :create, :destroy, :update, :show]
  end

  root "demands#index"
end
