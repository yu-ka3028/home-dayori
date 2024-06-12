Rails.application.routes.draw do
  root "static_pages#top"

  post '/your_homepost_path', to: 'posts#index'
  
  resources :posts do
    member do
      post 'vote'
    end
  end

  resources :users, only: %i[new create]
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
end
