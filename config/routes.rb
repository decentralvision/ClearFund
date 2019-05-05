Rails.application.routes.draw do
	get '/about' => 'welcome#about', as: '/about'
	get '/proposals' => 'proposals#index', as: '/proposals'
	get '/donate' => 'welcome#index', as: 'donate'
  root 'welcome#index'

	get '/signup' => 'users#new'

	get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'	
	get '/logout' => 'sessions#destroy'

	resources :proposals
	
	resources :users do
		resources :proposals
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
