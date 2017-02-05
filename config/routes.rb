Rails.application.routes.draw do
  scope 'admin' do
    resources :campaigns
    resources :items, only: [:create, :destroy]
  end

  get 'campanha/:campaign_id', to: 'items#index', as: 'landing_page'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :checkout, only: :create
  root 'campaigns#index'
end
