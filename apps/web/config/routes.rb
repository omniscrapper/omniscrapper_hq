root to: 'home#index'

resources :sites
resources :schemas
resources :tasks, only: [:new, :create, :index]

resources :dry_run, only: [:create]
resources :single_run, only: [:create]
