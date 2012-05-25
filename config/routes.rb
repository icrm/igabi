Igabi::Application.routes.draw do

  # Admin routes
  namespace :admin do
    resources :posts
    resources :sessions, only: [:new, :create, :destroy]

    root             to: "sessions#new"
    match "/logout", to: "sessions#destroy", via: :delete
    match "/home",   to: "static_pages#home"
  end
end
