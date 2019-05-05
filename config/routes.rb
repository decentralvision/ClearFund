Rails.application.routes.draw do

  root 'welcome#index'

	get '/donate' => 'treasury#donate', as: '/donate'
  get '/membership' => 'treasury#membership', as: '/membership'
	get '/about' => 'welcome#about', as: '/about'
	get '/proposals' => 'proposals#index', as: '/proposals'

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
