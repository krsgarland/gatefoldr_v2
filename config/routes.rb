Rails.application.routes.draw do
 root to: "pages#home"
 get '/about-us', to: "pages#about_us"
 resources :albums
end
