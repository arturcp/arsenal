Rails.application.routes.draw do
  resources :campaigns
  resources :items, only: [:create, :destroy]

  get 'campaign/:campaign_id/items', to: 'items#index', as: 'items_list'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :checkout, only: :create
  root 'campaigns#index'
end
