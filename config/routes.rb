Rails.application.routes.draw do
  devise_for :users
  get '/topicks', to: 'topicks#index'
  resources :topicks do
    collection do
      post :confirm
    end
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
