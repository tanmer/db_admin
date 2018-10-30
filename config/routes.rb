DbAdmin::Engine.routes.draw do
  namespace :api do
    resources :databases, only: [:index] do
      resources :schemas, only: [:index] do
        resources :tables, only: [:index] do
          resources :columns, only: [:index]
        end
      end
    end
  end
end
