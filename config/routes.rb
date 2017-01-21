Rails.application.routes.draw do
  resources :campaigns
  resources :items, only: :create
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'campaigns#index'
end
