class AddColumnValorComissaotoToIndicacao < ActiveRecord::Migration
  def change
  	add_column :indicacaos, :valor_comissao, :float
  end
end
