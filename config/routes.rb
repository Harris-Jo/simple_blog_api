Rails.application.routes.draw do
  resources :posts, only: [:index, :show, :create, :update, :destroy] do
    resources :likes, only: [:create, :destroy]
  end

  post '/signup', to: 'users#signup'
  post '/login', to: 'users#login'

  # Pagination
  get '/posts', to: 'posts#index'
end
