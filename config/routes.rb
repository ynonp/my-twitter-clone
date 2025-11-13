Rails.application.routes.draw do
  # Home page - show common feed
  root "tweets#index"
  
  # User registration
  get "signup", to: "users#new"
  post "signup", to: "users#create"
  
  # User authentication
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  # Tweets
  resources :tweets, only: [:index, :create, :destroy]
  
  # Follows
  post "follows/:id", to: "follows#create", as: "follow_user"
  delete "follows/:id", to: "follows#destroy", as: "unfollow_user"
  
  # Retweets
  post "retweets/:id", to: "retweets#create", as: "retweet_tweet"
  delete "retweets/:id", to: "retweets#destroy", as: "unretweet_tweet"
  
  # Health check
  get "up" => "rails/health#show", as: :rails_health_check
end
