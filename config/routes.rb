Rails.application.routes.draw do
  get 'users/show'
  resources :feeds
  post '/tops/guest_sign_in', to: 'tops#guest_sign_in'
  post '/tops/admin_guest_sign_in', to: 'tops#admin_guest_sign_in'
  root to: 'tops#index'
  resources :favorites, only: [:create, :destroy, :index]
  resources :users
  get '/users', to: 'users#index'
  # get '/users/show', to: 'users#show'  # 追加したけど違うかも
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
