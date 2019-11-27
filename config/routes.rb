Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations' }
  # resources :users do
  #   member do
  #   get :following, :followers
  #   end
  # end
  devise_scope :user do
    get 'show/:id/' => 'registrations#show', as: 'show'
    get 'show/:id/following', to: 'registrations#following', as: 'following'
    get 'show/:id/followers', to: 'registrations#followers', as: 'followers'
  end
  
  resources :relationships, only: [:create, :destroy]
  
  root 'posts#index'
  
  get '/users/:id', to: 'users#show', as: 'user'
  
  resources :posts, only: %i(new create index show destroy) do
    resources :photos, only: %i(create)
    resources :likes, only: %i(create destroy)
    resources :comments, only: %i(create destroy)
  end
end
