root to: 'home#index'
resources :sites
resources :schemas
get '/schemas/new', to: 'schemas#new'
post '/schemas', to: 'schemas#create'
