Mrhindicacao::Application.routes.draw do
  
  devise_for :users

  resources :user

  root :to => 'application#index'

  
end
