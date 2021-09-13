Rails.application.routes.draw do
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
