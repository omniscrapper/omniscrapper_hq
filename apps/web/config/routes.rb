root to: 'home#index'

resources :sites
resources :schemas
resources :tasks, only: [:new, :create, :index, :edit, :update]

resources :dry_run, only: [:create]
resources :single_run, only: [:create]
resources :test_results, only: [:index] do
  collection do
    delete :clear
  end
end
resources :outputs, only: [:index, :new, :create]
