class ContatoCliente < ActiveRecord::Base
  attr_accessible :cliente_id, :fone, :nome

  belongs_to :cliente

end
