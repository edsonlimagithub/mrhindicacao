#coding: utf-8
class Indicacao < ActiveRecord::Base

  attr_accessible :cliente_id, :data, :detalhes, :servico_id, :usuario_id
  belongs_to :user
  belongs_to :cliente
  belongs_to :servico

  validates :user,    :presence => {:message => "Usuário não pode estar em branco"}
  validates :cliente, :presence => {:message => "NÃO PODE ESTAR EM BRANCO"}
  validates :servico, :presence => {:message => "NÃO PODE ESTAR EM BRANCO"}
end
