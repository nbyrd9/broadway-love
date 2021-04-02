Rails.application.routes.draw do
  resources :users, except: [:new, :create] do
    resources :shows
  end
  
  resources :shows do
    resources :reviews
  end

  resources :reviews



  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: "users#home"
  get '/login', to: "sessions#new", as: "login"
  post '/login', to: "sessions#create"
  get '/signup', to: "users#new", as: "signup"
  post '/signup', to: "users#create"
  post '/logout', to: "sessions#destroy"
  get "/auth/google_oauth2/callback", to: "sessions#google_oauth2"
  post '/reviews/:id', to: "reviews#destroy"
  # get '/shows/:id', to: "shows#index"
  # get '/shows/:show_id/reviews/new', to: "reviews#new"
  # post '/shows/:show_id/reviews/new', to: "reviews#new"
  # post '/shows/:show_id/reviews', to: "reviews#create"
end
