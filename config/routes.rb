Rails.application.routes.draw do
  root "my_threads#index"
  resources :my_threads do
    resources :comments
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
