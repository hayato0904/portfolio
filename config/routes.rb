Rails.application.routes.draw do
  # get 'users/show'
  post '/tops/guest_sign_in', to: 'tops#guest_sign_in'
  post '/tops/admin_guest_sign_in', to: 'tops#admin_guest_sign_in'
  root to: 'tops#index'
  resources :favorites, only: [:create, :destroy, :index]
  
  # usersのindex,create,new以外のルーティングを設定=====
  resources :users, except: [:create, :new]
  # usersのindex,create,new以外のルーティングを設定=====

  # usersを開いた際にshowをすぐ開くようにルーティングを設定=====
  get '/users', to: 'users#index'
  # usersを開いた際にshowをすぐ開くようにルーティングを設定=====

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  # topicksのルーティングを設定======
  get '/topicks', to: 'topicks#index'
  # topicksのルーティングを設定======

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


