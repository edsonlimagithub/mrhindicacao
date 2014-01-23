#coding: utf-8
class Cliente < ActiveRecord::Base
  attr_accessible :contato, :email, :nome, :observacao, :telefone, :cnpj

  has_many :indicacaos, :dependent => :restrict

  validates :cnpj, :uniqueness => {:message => "JÁ EXISTE"}
  validates :cnpj, :presence => {:message => "NÃO PODE ESTAR EM BRANCO"}
  validates :nome, :presence => {:message => "NÃO PODE ESTAR EM BRANCO"}
  
end
