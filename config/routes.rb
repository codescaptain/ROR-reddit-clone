Rails.application.routes.draw do
  resources :subscriptions
  get 'profile/index'
  get 'posts/index'
  devise_for :accounts
  get "profile/:username", to: "public#profile", as: "profile"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :communities do
    resources :posts
  end
  resources :subscriptions 
  resources :comments, only: [:create]
  post "post/vote" => "votes#create"
  root to: "public#index"
end
