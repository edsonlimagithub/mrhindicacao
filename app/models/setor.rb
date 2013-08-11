class Setor < ActiveRecord::Base
  has_many :users
  attr_accessible :descricao

end
