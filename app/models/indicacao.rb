class Indicacao < ActiveRecord::Base
  attr_accessible :cliente_id, :data, :detalhes, :servico_id, :usuario_id
  belongs_to :user
  belongs_to :cliente
  belongs_to :servico
end
