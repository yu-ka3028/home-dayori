Rails.application.routes.draw do
  root "static_pages#top"

  post '/your_homepost_path', to: 'posts#index'
  resources :posts
end
