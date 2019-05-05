Rails.application.routes.draw do

  root 'welcome#index'

	get '/donate' => 'treasury#donate', as: '/donate'
	post '/process_donation' => 'treasury#process_donation', as: "/processing"
	get '/about' => 'welcome#about', as: '/about'
	get '/proposals' => 'proposals#index', as: '/proposals'

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
