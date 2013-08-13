Mrhindicacao::Application.routes.draw do
  
  resources :indicacaos

  resources :servicos

  resources :clientes

  get "user/index"

  resources :roles

  resources :setors

  devise_for :users

  resources :user

  root :to => 'application#index'

  match "/user/criar_novo" => "user#criar_novo"
  #direciona para lista de clientes modal
  match "/cliente/index_modal" =>  "clientes#index_modal"
  #direciona para new cliente modal
  match "/cliente/new_modal" => "clientes#new_modal"

  
end
