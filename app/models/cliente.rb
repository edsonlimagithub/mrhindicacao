#coding: utf-8
class Cliente < ActiveRecord::Base
  attr_accessible :contato, :email, :nome, :observacao, :telefone
  has_many :indicacaos, :dependent => :restrict

  validates :nome, :presence => {:message => "NÃO PODE ESTAR EM BRANCO"}
  
end
