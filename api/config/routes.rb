Rails.application.routes.draw do
  # Tasks
  resources :tasks

  # Users
  resources :users do
    collection do
      get 'show_by_username', to: 'users#show_by_username'
    end
    member do
      get 'tasks', to: 'users#tasks_by_user'
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
