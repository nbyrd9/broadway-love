Rails.application.routes.draw do
  resources :users, except: [:show, :index, :new, :create, :destroy, :patch, :put] do
    resources(:shows, except: [:show, :edit, :update, :destroy, :put] )
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
end
