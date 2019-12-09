root to: 'home#index'

resources :sites
resources :schemas, only: [:index, :new, :create, :edit, :update]
resources :tasks

resources :dry_run, only: [:create]
resources :single_run, only: [:create]
resources :test_results, only: [:index] do
  collection do
    delete :clear
  end
end
resources :outputs, only: [:index, :new, :create, :edit, :update]
get '/tasks/:id/jobs', to: 'tasks#jobs', as: :task_statistics
