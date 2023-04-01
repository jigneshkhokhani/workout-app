Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "dashboards#index"

  resources :users do
    resources :exercises
  end

  resource :dashboards, only: [:index] do
    collection do
      post :search, to: 'dashboards#search'
    end
  end
end
