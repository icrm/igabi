Igabi::Application.routes.draw do

  # Admin routes
  namespace :admin do
  
    resources :posts
    resources :sessions, only: [:new, :create, :destroy]
    resources :uploads

    root             to: "sessions#new"
    match "/logout", to: "sessions#destroy", via: :delete
    match "/home",   to: "static_pages#home"

    # Upload
    # match "/upload",  to: "upload#index"
    # match "/upload",  to: "upload#destroy", via: :delete
    # match "/upload",  to: "upload#create",  via: :post

  end
  
end
