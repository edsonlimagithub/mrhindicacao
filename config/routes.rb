Mrhindicacao::Application.routes.draw do
  
  resources :roles

  resources :setors

  devise_for :users

  resources :user

  root :to => 'application#index'

  
end
