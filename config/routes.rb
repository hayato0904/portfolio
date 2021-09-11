Rails.application.routes.draw do
  get '/topicks', to: 'topicks#index'
  resources :topicks
end
