class AddColumnValorFechamentoToIndicacao < ActiveRecord::Migration
  def change
  	add_column :indicacaos, :valor_fechamento, :float
  end
end
