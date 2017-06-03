Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :campaigns
    resources :articles
    resources :campaign_news
    resources :users, only: :index
    resources :items, only: [:create, :destroy]
    resources :orders, only: [:create, :destroy]
    resources :campaign_messages, only: [:show, :update]
  end

  resources :shopping_cart, only: [:index, :create, :destroy]
  resources :checkouts, only: [:create, :show]
  resource :notifications, only: :create
  resources :home, only: [:index, :show]

  namespace :campaigns, path: '' do
    resources :landings, only: :show, path: 'campanha'
  end

  get 'admin', to: redirect('/admin/campaigns')
  root to: "home#index"
end
