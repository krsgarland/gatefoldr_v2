Rails.application.routes.draw do
 root to: "pages#home"
 get '/about-us', to: "pages#about_us"
 get '/sign-up', to: "users#new"
 resources :users, except: [:new]
 resources :categories
 resources :albums
end

