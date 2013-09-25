class AddColumnValorComissaoToServicos < ActiveRecord::Migration
  def change
  	add_column :servicos, :comissao_valor, :float
  end
end
