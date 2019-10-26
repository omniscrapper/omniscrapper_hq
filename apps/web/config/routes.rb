root to: 'home#index'
resources :sites
resources :schemas
get '/schemas/new', to: 'schemas#new'
