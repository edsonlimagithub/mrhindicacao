#coding: utf-8
class Servico < ActiveRecord::Base
  attr_accessible :descricao, :porcentagem, :email, :detalhes, :comissao_valor

   validates :email,    :presence => {:message => "não pode ficar em branco."}

end
