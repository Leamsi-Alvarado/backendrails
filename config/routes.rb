Rails.application.routes.draw do
  Rails.application.routes.draw do
    resources :users, only: [:index, :new, :create]
  end
  namespace :api do
    namespace :v1 do
      resources :articles,  only: [:index, :show, :create, :update, :destroy]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
