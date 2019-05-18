# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#about'
  # get '/about' => 'welcome#about', as: '/about'
  # Routes for Google authentication
  get 'auth/:provider/callback', to: 'sessions#googleAuth'
  get 'auth/failure', to: redirect('/')
  
  get '/donate' => 'treasury#donate', as: '/donate'
  post '/process_donation' => 'treasury#process_donation', as: '/processing'

  get '/proposals' => 'proposals#index', as: '/proposals'
  get '/funded' => 'proposals#funded', as: '/funded'
  get '/expired' => 'proposals#expired', as: '/expired'
  get '/signup' => 'users#new'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/memberships' => 'memberships#new'

  resources :users do
    resources :proposals
    resources :memberships
    resources :votes
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
