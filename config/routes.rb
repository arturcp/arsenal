Rails.application.routes.draw do
  scope 'admin' do
    resources :campaigns
    resources :items, only: [:create, :destroy]
  end

  resources :shopping_cart, only: [:index, :create, :destroy]

  get 'campanha/:campaign_id', to: 'items#index', as: 'landing_page'

  resources :checkouts, only: [:create, :show]
  resource :notifications, only: :create
  get 'admin', to: redirect('/admin/campaigns')
end
