class Cliente < ActiveRecord::Base
  attr_accessible :contato, :email, :nome, :observacao, :telefone
  has_many :indicacoes
end
