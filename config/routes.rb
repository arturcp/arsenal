Rails.application.routes.draw do
  resources :campaigns
  resources :items, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :checkout, only: :create
  root 'campaigns#index'
end
