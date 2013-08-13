class Cliente < ActiveRecord::Base
  attr_accessible :contato, :email, :nome, :observacao, :telefone
end
