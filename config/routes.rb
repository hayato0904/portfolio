Rails.application.routes.draw do
  root to: 'tops#index'
  resources :favorites, only: [:create, :destroy]
  get '/users', to: 'users#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  get '/topicks', to: 'topicks#index'
  resources :topicks do
    collection do
      post :confirm
    end
      resources :comments
    
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
