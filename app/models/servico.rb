#coding: utf-8
class Servico < ActiveRecord::Base
  attr_accessible :descricao, :porcentagem, :email, :detalhes

   validates :email,    :presence => {:message => "não pode ficar em branco."}

end
