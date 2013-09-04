Mrhindicacao::Application.routes.draw do
  
  resources :indicacaos

  resources :servicos

  resources :clientes

  resources :relatorio

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
  match "/cliente/novo_modal" => "clientes#novo_modal"
  #cria novo cliente pela janela modal
  match "/cliente/create_modal" => "clientes#create_modal"
  #enviar email das indicações marcadas
  match '/indicacao/enviar_email' => 'indicacaos#enviar_email'
  #filtro para relatório de indicações
  match '/relatorios/indicacoes_filtro' => 'relatorio#indicacoes_filtro'
  #relatório de indicações
  match 'relatorios/indicacoes' => 'relatorio#indicacoes'

  
end
