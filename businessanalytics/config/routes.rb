Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :dashboards
      resources :data_sources
      resources :fetched_data
      # resources :dashboards, only: [:index, :show, :create, :update, :destroy]
      # resources :data_sources, only: [:index, :show, :create, :update, :destroy]
      # resources :fetched_data, only: [:index, :show, :create, :update, :destroy]
    end
  end

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  

   # Dashboard routes for authenticated users
   authenticated :user do
    root 'dashboard#index', as: :authenticated_root
  end

  # Home routes for unauthenticated users
  unauthenticated do
    root 'home#index', as: :unauthenticated_root
  end
end
