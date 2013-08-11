Mrhindicacao::Application.routes.draw do
  
  get "user/index"

  resources :roles

  resources :setors

  devise_for :users

  resources :user

  root :to => 'application#index'

  match "/user/criar_novo" => "user#criar_novo"

  
end
