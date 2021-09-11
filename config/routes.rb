Rails.application.routes.draw do
  get 'topicks/index'
  resources :topicks
end
